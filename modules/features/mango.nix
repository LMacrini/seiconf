{ lib, ... }:
{
  flake.file.inputs.mango = {
    url = "github:mangowm/mango";
    inputs = {
      nixpkgs.follows = "nixpkgs";
      flake-parts.follows = "flake-parts";
      scenefx.inputs = {
        flake-utils.follows = "flake-utils";
        systems.follows = "flake-utils/systems";
      };
    };
  };

  flake.aspects.mango.deps = [
    "desktop"
    "hjem"
    "ly"
    "swayidle"
    "swaync"
    "trash"
    "waybar"
    "wayland-pipewire-idle-inhibit"
    "wpaperd"
  ];

  flake.aspects.mango.module =
    {
      pkgs,
      config,
      inputs',
      self',
      ...
    }:
    let
      # NOTE: in 26.11, can use nixpkgs version (probably)
      # might be a good idea to use unstable nixpkgs,
      # or maybe just keep using the flake until
      # updates slow down, unsure
      mango = inputs'.mango.packages.mango;
    in
    {
      environment.systemPackages = [
        mango
      ];

      programs.mangowc = {
        enable = true;
        package = mango;
      };

      xdg.portal.wlr = {
        enable = true;
        settings = {
          screencast = {
            chooser_cmd = "${lib.getExe self'.packages.rofi} -dmenu -i";
            chooser_type = "dmenu";
          };
        };
      };

      security = {
        pam.services.swaylock = { };
        polkit.enable = true; # should be on by default but doesn't hurt
        soteria.enable = true;
      };

      services = {
        displayManager.defaultSession = "mango";
        graphical-desktop.enable = true;
        gnome.gnome-keyring.enable = true;

        logind.settings.Login.HandleLidSwitch = "ignore";

        pipewire = {
          enable = true;
          jack.enable = true;
        };
      };

      hjem.users.lioma =
        let
          autostart = pkgs.writeShellScriptBin "autostart.sh" ''
            systemctl --user reset-failed
            systemd-inhibit --who="mangowc config" \
                --why="power button keybind" \
                --what=handle-power-key \
                --mode=block \
                sleep infinity \
                & echo $! > /tmp/.mangowc-systemd-inhibit
          '';

          monitors =
            config.preferences.monitors
            |> lib.mapAttrsToList (
              n: v:
              with v;
              "monitor_rule=name:${n},width:${width},height:${height},refresh:${refreshRate},x:${x},y:${y},scale:${scale}"
            )
            |> builtins.concatStringsSep "\n";

          launcher = "pkill rofi || rofi -show drun";
          sessionMenu = "wlogout";
        in
        {
          wrappers.waybar = {
            enable = true;
            package = inputs'.waybar.packages.waybar.override {
              waybar = pkgs.waybar.override {
                cavaSupport = false;
                runTests = false;
                niriSupport = false;
              };
            };

            settings = {
              modules-left = [
                "mango/workspaces"
                "mango/window"
              ];

              "mango/workspaces" = {
                on-click = "activate";
                hide-empty = true;
              };

              "mango/window" = {
                format = "  {title}";
                rewrite = {
                  " (.*) - YouTube — LibreWolf" = "   $1";
                  "  NixOS Search - (.*) — LibreWolf" = "  󱄅 $1";
                  " (.*) — LibreWolf" = "   $1";
                };
              };
            };

            style.content = # css
              ''
                #workspaces button {
                  border-radius: 0;
                  box-shadow: inset 0px 2px 0px transparent;
                  transition: box-shadow 0.2s ease;
                }

                #workspaces button.active {
                  box-shadow: inset 0px 2px 0px white;
                }
              '';
          };

          packages = with pkgs; [
            brightnessctl
            nautilus
            satty
            wireplumber
            wl-clipboard
            zenity

            self'.packages.kitty-system
            self'.packages.rofi
            self'.packages.wlogout

            # redundant but technically i do use it
            systemd
          ];

          environment.sessionVariables = {
            TERMINAL = "kitty";
          };

          gtk.css.common = # css
            ''
              headerbar.default-decoration {
                margin-bottom: 50px;
                margin-top: -100px;
              }

              window.csd,             /* gtk4? */
              window.csd decoration { /* gtk3 */
                box-shadow: none;
              }
            '';

          services.swayidle =
            let
              swaylock = lib.getExe self'.packages.swaylock;
            in
            {
              events = [
                {
                  event = "before-sleep";
                  command = "${swaylock} --fade-in 0";
                }
                {
                  event = "lock";
                  command = "${swaylock} --grace 10";
                }
              ];
            };

          wayland.systemd.target = "mango-session.target";

          systemd.targets.mango-session = {
            after = [ "graphical-session-pre.target" ];
            bindsTo = [ "graphical-session.target" ];
            wants = [ "graphical-session-pre.target" ];
            description = "mango compositor session";
            documentation = [ "man:systemd.special(7)" ];

            wantedBy = [ "graphical-session.target" ];
          };

          xdg.config.files."mango/config.toml".source =
            let
              toml = pkgs.formats.toml { };
            in
            (
              f:
              pkgs.runCommand "mango.toml"
                {
                  nativeBuildInputs = [ mango ];
                  conf = f;
                }
                ''
                  mango -c $conf -p
                  cp $conf $out
                ''
            )
            <| toml.generate "mango.toml" {
              global = {
                exec_once = [
                  "kitty"
                  "waybar"
                  (lib.getExe pkgs.networkmanagerapplet)
                  (lib.getExe' pkgs.blueman "blueman-applet")
                  (lib.getExe autostart)
                ];

                trackpad_natural_scrolling = 1;
                trackpad_click_method = 2;

                focus_color = "0xff6ed4ff";

                xkb_rules_layout = "us,gr";
                xkb_rules_options = "compose:ralt";

                scroller_proportion_preset = "1,0.7,0.5,0.3";

                enable_hotarea = 0;

                cursor_hide_timeout = 5;
                new_is_master = 0;
                smart_gaps = 1;
                drag_tile_to_tile = 1;
              };

              env = {
                ELECTRON_OZONE_PLATFORM_HINT = "wayland";
                PROTON_ENABLE_WAYLAND = 1;
              };

              bind.default = {
                "SUPER+CTRL+S" = "spawn_shell,grim -t ppm - | satty -c /dev/null -f - -o - | wl-copy";
                "SUPER+SHIFT+S" = "spawn,${lib.getExe self'.packages.screenshot}";

                "NONE+XF86AudioRaiseVolume" = "spawn,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
                "NONE+XF86AudioLowerVolume" = "spawn,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
                "NONE+XF86AudioMute" = "spawn,wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
                "NONE+XF86AudioMicMute" = "spawn,wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
                "NONE+XF86MonBrightnessUp" = "spawn,brightnessctl s 10%+";
                "NONE+XF86MonBrightnessDown" = "spawn,brightnessctl s 10%-";
                "NONE+XF86PowerOff" = "spawn,systemctl suspend";

                "SUPER+Q" = "spawn,kitty";
                "SUPER+T" = "spawn_shell,${launcher}";
                "ALT+space" = "spawn_shell,${launcher}";
                "SUPER+C" = "smartkillclient";
                "SUPER+Return" = "zoom";
                "SUPER+L" = "spawn,${sessionMenu}";

                "SUPER+N" = "focusstack,next";
                "SUPER+E" = "focusstack,prev";
                "SUPER+M" = "setmfact,-0.05";
                "SUPER+I" = "setmfact,+0.05";

                "SUPER+O" = "minimized";
                "SUPER+SHIFT+O" = "restore_minimized";
                "SUPER+H" = "toggle_scratchpad";
                "SUPER+K" = "toggle_named_scratchpad,kitty-scratch,none,kitty --app-id kitty-scratch";

                "SUPER+U" = "incnmaster,+1";
                "SUPER+D" = "incnmaster,-1";

                "SUPER+code:60" = "focusmon,right";
                "SUPER+SHIFT+code:60" = "tagmon,right";
                "SUPER+code:59" = "focusmon,left";
                "SUPER+SHIFT+code:59" = "tagmon,left";

                "SUPER+Up" = "focusdir,up";
                "SUPER+Down" = "focusdir,down";
                "SUPER+Left" = "focusdir,left";
                "SUPER+Right" = "focusdir,right";

                "SUPER+SHIFT+Up" = "exchange_client,up";
                "SUPER+SHIFT+Down" = "exchange_client,down";
                "SUPER+SHIFT+Left" = "exchange_client,left";
                "SUPER+SHIFT+Right" = "exchange_client,right";

                "SUPER+F" = "togglefullscreen";
                "SUPER+SHIFT+F" = "togglefloating";
                "SUPER+SHIFT+M" = "togglemaximizescreen";
                "SUPER+G" = "toggleglobal";

                "SUPER+W" = "setlayout,fair";
                "SUPER+SHIFT+T" = "setlayout,tile";
                "SUPER+S" = "setlayout,scroller";
                "SUPER+CTRL+M" = "setlayout,monocle";

                "SUPER+R" = "switch_proportion_preset";

                "SUPER+Y" = "toggleoverview";
              }
              // lib.mergeAttrsList (
                builtins.genList (
                  i:
                  let
                    ws = toString (i + 1);
                  in
                  {
                    "SUPER+${ws}" = "view,${ws}";
                    "SUPER+SHIFT+${ws}" = "tag,${ws}";
                    "SUPER+CTRL+${ws}" = "toggleview,${ws}";
                    "SUPER+CTRL+SHIFT+${ws}" = "toggletag,${ws}";
                  }
                ) 9
              );

              gesturebind.default = {
                "NONE+left+3" = "viewtoright_have_client";
                "NONE+right+3" = "viewtoleft_have_client";
              };

              switchbind.default = {
                "lid_off" = "spawn,systemctl suspend";
              };

              mousebind.default = {
                "SUPER+btn_left" = "moveresize,curmove";
                "SUPER+btn_right" = "moveresize,curresize";
              };

              rule = {
                tag_rule = builtins.genList (i: {
                  id = i + 1;
                  layout_name = "fair";
                }) 9;

                window_rule = [
                  {
                    app_id = "steam";
                    title = "^notificationtoasts_\\d+_desktop$";
                    is_open_silent = 1;
                    is_global = 1;
                    offset_x = 100;
                    offset_y = 100;
                  }
                  {
                    app_id = "re-lunatic-player";
                    is_floating = 1;
                    is_global = 1;
                  }
                  {
                    app_id = "spacewarp";
                    is_floating = 1;
                  }
                  {
                    app_id = "kitty-scratch";
                    is_named_scratchpad = 1;
                  }
                ];

                monitor_rule =
                  config.preferences.monitors
                  |> lib.mapAttrsToList (
                    n: v: {
                      inherit (v)
                        width
                        height
                        x
                        y
                        scale
                        ;
                      name = n;
                      refresh = v.refreshRate;
                    }
                  );
              };
            };
        };
    };
}
