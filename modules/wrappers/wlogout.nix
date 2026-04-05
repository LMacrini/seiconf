{
  self,
  lib,
  ...
}:
{
  flake.wrappers.wlogout =
    {
      pkgs,
      wlib,
      inputs',
      ...
    }:
    let
      catppuccin = inputs'.catppuccin.packages.wlogout;
      style = pkgs.writeText "style.css" ''
        @import url("${catppuccin}/themes/macchiato/pink.css");

        ${lib.concatMapStrings
          (
            icon: # css
            ''
              #${icon} {
                background-image: url("${catppuccin}/icons/wlogout/macchiato/pink/${icon}.svg");
              }
            '')
          [
            "hibernate"
            "lock"
            "logout"
            "reboot"
            "shutdown"
            "suspend"
          ]
        }
      '';
    in
    {
      imports = [
        wlib.modules.default
        self.nixosModules.inputs
      ];

      package = pkgs.wlogout;
      extraPackages = [
        pkgs.systemd
      ];

      flags = {
        "--css" = style;
      };
    };
}
