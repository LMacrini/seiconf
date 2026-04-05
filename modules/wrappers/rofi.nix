{ self, ... }:
{
  flake.wrappers.rofi =
    {
      wlib,
      inputs',
      ...
    }:
    let
      catppuccin = inputs'.catppuccin.packages.rofi;
    in
    {
      imports = [
        wlib.wrapperModules.rofi
        self.nixosModules.inputs
      ];

      settings = {
        display-drun = ":3 ";
        show-icons = true;
      };

      theme = {
        "@theme" = "${catppuccin}/catppuccin-default.rasi";
        "@import" = "${catppuccin}/themes/catppuccin-macchiato.rasi";
      };
    };
}
