{
  lib,
  self,
  ...
}:
{
  flake.aspects.waybar.deps = [ "hjem" ];
  flake.aspects.waybar.module = {
    hjem.extraModules = [
      self.wrappers.waybar.install
    ];
  };

  perSystem = {
    wrappers.packages.waybar = true;
  };

  flake.wrappers.waybar =
    {
      wlib,
      pkgs,
      config,
      ...
    }@args:
    let
      format = pkgs.formats.json { };
    in
    {
      imports = [ wlib.modules.default ];
      options = {
        settings = lib.mkOption {
          type = format.type;
          default = { };
        };

        style = lib.mkOption {
          type = wlib.types.file pkgs;
          default.content = "";
        };
      };

      config = {
        package = lib.mkDefault pkgs.waybar;

        install.modules = {
          hjem =
            { config, ... }:
            let
              cfg = args.config.install.getWrapperConfig config;
            in
            {
              packages = lib.mkIf cfg.enable [
                cfg.wrapper
              ];
            };
        };

        flags = {
          "--config" = format.generate "config" config.settings;
          "--style" = config.style.path;
        };

        settings = {
          modules-center = [ "clock" ];
          modules-right = [
            "tray"
            "idle_inhibitor"
            "power-profiles-daemon"
            "custom/notification"
            "pulseaudio"
            "battery"
          ];

          battery = {
            format = " {icon} {capacity}% ";
            format-charging = " 󱐋{icon} {capacity}% ";
            format-icons = [
              "󰁺"
              "󰁻"
              "󰁼"
              "󰁽"
              "󰁾"
              "󰁿"
              "󰂀"
              "󰂁"
              "󰂂"
              "󰁹"
            ];
          };

          clock = {
            format = "{:%F %H:%M}";
            interval = 1;
            tooltip-format = "{:%a %b %d %H:%M:%S %Y}";
          };

          "custom/notification" = {
            tooltip = false;
            format = " {icon} ";
            format-icons = {
              notification = "<span foreground='red'><sup></sup></span>";
              none = "";
              dnd-notification = "<span foreground='red'><sup></sup></span>";
              dnd-none = "";
              inhibited-notification = "<span foreground='red'><sup></sup></span>";
              inhibited-none = "";
              dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
              dnd-inhibited-none = "";
            };
            return-type = "json";
            exec-if = "which swaync-client";
            exec = "swaync-client -swb";
            on-click = "swaync-client -d -sw";
            on-click-right = "swaync-client -t -sw";
            escape = true;
          };

          idle_inhibitor = {
            format = " {icon} ";
            format-icons = {
              activated = "";
              deactivated = "";
            };
          };

          power-profiles-daemon = {
            format = " {icon} ";
            # tooltip-format = "Power profile: {profile}\nDriver: {driver}";
            tooltip-format = ''
              Power profile: {profile}
              Driver: {driver}'';

            tooltip = true;
            format-icons = {
              default = "";
              performance = "";
              balanced = "";
              power-saver = "";
            };
          };

          pulseaudio = {
            on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
            on-click-right = "pavucontrol";

            format = " {icon} {volume}% ";
            format-icons = {
              default = [
                "󰕿"
                "󰖀"
                "󰕾"
              ];
              default-muted = "󰖁";
              headphone = "󰋋";
              headphone-muted = "󰟎";
              headset = "󰋎";
              headset-muted = "󰋐";
              "alsa_output.usb-SteelSeries_Arctis_Nova_3-00.analog-stereo" = "󰋎";
              "alsa_output.usb-SteelSeries_Arctis_Nova_3-00.analog-stereo-muted" = "󰋐";
            };
          };

          tray = {
            show-passive-items = true;
            spacing = 10;
            reverse-direction = true;
            sort-by-app-id = true;
          };
        };
      };
    };
}
