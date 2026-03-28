{lib, ...}: {
  flake.hjemModules.gtk = {config, ...}: let
    inherit (lib) mkOption types mkEnableOption optionalAttrs;
    cfg = config.gtk;
    cssType = mkOption {
      type = types.lines;
      default = "";
    };

    toGtkINI = lib.generators.toINI {
      mkKeyValue = n: v: let
        n' =
          if lib.hasPrefix "gtk-" n
          then n
          else "gtk-${n}";

        v' =
          if builtins.isBool v
          then lib.boolToString v
          else toString v;
      in "${n'}=${v'}";
    };

    toGtk2Text = let
      formatGtk2 = n: v: let
        n' =
          if lib.hasPrefix "gtk-" n
          then n
          else "gtk-${n}";
        v' =
          if builtins.isBool v
          then lib.boolToString v
          else if lib.isString v
          then
            if lib.hasPrefix "GTK_" v
            then v
            else ''"${v}"''
          else toString v;
      in "${n'}=${v'}";
    in
      settings: builtins.concatStringsSep "\n" (lib.mapAttrsToList formatGtk2 settings);
  in {
    options.gtk = {
      enable = mkEnableOption "gtk";

      settings = mkOption {
        type = with types;
          attrsOf
          <| oneOf [
            bool
            int
            str
            float
          ];
        default = {};
      };

      gtk2Location = mkOption {
        type = types.str;
        default = ".gtkrc-2.0";
        defaultText = "$HOME/.gtkrc-2.0";
      };

      css = {
        common = cssType;
        gtk3 = cssType;
        gtk4 = cssType;
      };

      bookmarks = mkOption {
        type = types.listOf types.str;
        default = [];
      };
    };

    config = let
      isSettings = cfg.settings != {};
      isCommonCss = cfg.css.common != "";
    in {
      files = optionalAttrs isSettings {
        ${cfg.gtk2Location}.text = toGtk2Text cfg.settings;
      };
      xdg.config.files =
        optionalAttrs isSettings {
          "gtk-3.0/settings".text = toGtkINI {Settings = cfg.settings;};
          "gtk-4.0/settings".text = toGtkINI {Settings = cfg.settings;};
        }
        // optionalAttrs (isCommonCss || cfg.css.gtk3 != "") {
          "gtk-3.0/gtk.css".text = cfg.css.common + cfg.css.gtk3;
        }
        // optionalAttrs (isCommonCss || cfg.css.gtk4 != "") {
          "gtk-4.0/gtk.css".text = cfg.css.common + cfg.css.gtk4;
        }
        // optionalAttrs (cfg.bookmarks != []) {
          "gtk-3.0/bookmarks".text = builtins.concatStringsSep "\n" cfg.bookmarks;
        };

      environment.sessionVariables = {
        GTK2_RC_FILES = "${config.directory}/${cfg.gtk2Location}";
        GTK_THEME = lib.mkIf (cfg.settings ? theme-name) cfg.settings.theme-name;
      };
    };
  };
}
