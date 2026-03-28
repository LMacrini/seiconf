{
  inputs,
  lib,
  self,
  ...
}: {
  flake.file.inputs = {
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # probably not a necessary thing, will be doing it anyway :3
  flake.hjemModules.userDirs = {
    config,
    pkgs,
    ...
  }: let
    inherit (lib) mkOption types;
    dir = with types; coercedTo path toString str;

    cfg = config.xdg.userDirs;
  in {
    options = {
      xdg.userDirs = {
        enable = lib.mkEnableOption "xdg user dirs";
        createDirectories = lib.mkEnableOption "automatic creation of xdg user dirs" // {default = true;};

        package = lib.mkPackageOption pkgs "xdg-user-dirs" {nullable = true;};

        desktop = mkOption {
          type = types.nullOr dir;
          default = null; # the desktop directory sucks
        };

        documents = mkOption {
          type = types.nullOr dir;
          default = "${config.directory}/Documents";
        };

        download = mkOption {
          type = types.nullOr dir;
          default = "${config.directory}/Downloads";
        };

        music = mkOption {
          type = types.nullOr dir;
          default = "${config.directory}/Music";
        };

        pictures = mkOption {
          type = types.nullOr dir;
          default = "${config.directory}/Pictures";
        };

        publicShare = mkOption {
          type = types.nullOr dir;
          default = "${config.directory}/Public";
        };

        videos = mkOption {
          type = types.nullOr dir;
          default = "${config.directory}/Videos";
        };

        extraConfig = mkOption {
          type = types.attrsOf dir;
          default = {};
        };

        setSessionVariables = lib.mkEnableOption "setting xdg user dir session variables";
      };
    };

    config = let
      directories =
        (lib.filterAttrs (n: v: !isNull v) {
          DESKTOP = cfg.desktop;
          DOCUMENTS = cfg.documents;
          DOWNLOAD = cfg.download;
          MUSIC = cfg.music;
          PICTURES = cfg.pictures;
          PUBLICSHARE = cfg.publicShare;
          VIDEOS = cfg.videos;
        })
        // cfg.extraConfig;

      bindings = lib.mapAttrs' (k: lib.nameValuePair "XDG_${k}_DIR") directories;
    in
      lib.mkIf cfg.enable {
        xdg.config.files = {
          "user-dirs.dirs" = {
            generator = lib.generators.toKeyValue {};
            value = builtins.mapAttrs (_: value: ''"${value}"'') bindings;
          };

          # disables xdg-user-dirs-update, which tries to modify $XDG_CONFIG_HOME/user-dirs.dirs
          "user-dirs.conf".text = "enabled=False";
        };

        packages = lib.mkIf (cfg.package != null) [cfg.package];
        environment.sessionVariables = lib.mkIf (cfg.setSessionVariables) bindings;

        systemd.services.createXdgUserDirectories = lib.mkIf (cfg.createDirectories) {
          description = "creates xdg user directories";
          wantedBy = ["default.target"];

          script = let
            directoriesList = lib.attrValues directories;
            mkdir = dir: ''[[ -L "${dir}" ]] || mkdir -p "${dir}"'';
          in
            lib.concatMapStringsSep "\n" mkdir directoriesList;

          serviceConfig = {
            Type = "oneshot";
          };
        };
      };
  };

  flake.aspects.hjem.module = {config, ...}: {
    imports = [
      inputs.hjem.nixosModules.default
    ];

    hjem = let
      mod = {
        options = with lib; {
          wayland.systemd.target = mkOption {
            type = self.lib.types.systemd.target;
            default = "graphical-session.target";
          };

          # TODO: make this system wide
          configDirectory = mkOption {
            type = types.str;
          };
        };
      };
    in {
      extraModules = [
        self.hjemModules.gtk
        self.hjemModules.userDirs
        mod
      ];

      users.lioma = let
        cfg = config.hjem.users.lioma;
      in {
        enable = true;
        directory = "/home/lioma";
        configDirectory = "${cfg.directory}/seiconf";
        user = "lioma";

        files.".editorconfig".text =
          # ini
          ''
            root = true

            [*]
            end_of_line = lf
            indent_size = 4
            insert_final_newline = true
            charset = utf-8

            [*.{nix,hs}]
            indent_size = 2
          '';

        files.".profile" = {
          executable = true;
          source = config.hjem.users.lioma.environment.loadEnv;
        };

        environment.sessionVariables = {
          NH_FLAKE = cfg.configDirectory;
        };

        xdg.config.files = {
          "fish/conf.d/hjem-environment.fish" = lib.mkIf (cfg.environment.sessionVariables != {}) {
            text =
              lib.concatMapAttrsStringSep "\n" (
                name: value: "set -gx ${lib.escapeShellArg name} ${lib.escapeShellArg (toString value)}"
              )
              cfg.environment.sessionVariables;
          };
        };

        xdg.userDirs = {
          enable = true;
          extraConfig = {
            GAMES = "${cfg.directory}/Games";
            PROJECTS = "${cfg.directory}/Projects";
          };
        };
      };

      clobberByDefault = true;
    };
  };
}
