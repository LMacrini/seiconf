{
  self,
  lib,
  ...
}:
{
  flake.nixosModules.base =
    {
      config,
      pkgs,
      ...
    }:
    let
      ifPlymouth = lib.mkIf config.boot.plymouth.enable;
    in
    {
      boot = {
        consoleLogLevel = ifPlymouth 3;
        initrd.verbose = ifPlymouth false;
        kernelParams = ifPlymouth [
          "quiet"
          "splash"
          "boot.shell_on_fail"
          "udev.log_priority=3"
          "rd.systemd.show_status=auto"
        ];

        kernelModules = lib.optional config.programs.steam.enable "ntsync";

        loader = {
          efi.canTouchEfiVariables = true;
          timeout = ifPlymouth <| lib.mkDefault 1; # if the bootloader is ever systemd this can be set to 0

          limine = {
            enable = true;

            style = {
              wallpapers = [
                "${self.images}/background.jpg"
              ];
              wallpaperStyle = "stretched";

              interface = {
                branding = "${config.system.nixos.distroName} ${config.system.nixos.release}";
              };
            };

            extraConfig = ifPlymouth ''
              quiet: yes
            '';
          };
        };

        plymouth = rec {
          enable = true;
          logo = "${self.images}/logo.png";
          theme = "breeze";
          themePackages = [
            (pkgs.kdePackages.breeze-plymouth.override {
              logoFile = logo;
              logoName = "miracle-mallet";
              osName = config.system.nixos.distroName;
              osVersion = config.system.nixos.release;
            })
          ];
        };
      };
    };
}
