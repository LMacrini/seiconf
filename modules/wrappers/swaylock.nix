{
  lib,
  self,
  ...
}: {
  flake.wrappers.swaylock = {
    pkgs,
    wlib,
    inputs',
    ...
  }: let
    catppuccin =
      lib.importJSON
      <| pkgs.runCommand "converted.json" {
        nativeBuildInputs = [pkgs.jc];
        conf = "${inputs'.catppuccin.packages.swaylock}/macchiato.conf";
      } ''
        jc --ini < $conf > $out
      '';
  in {
    imports = [
      wlib.wrapperModules.swaylock
      self.nixosModules.inputs
    ];
    package = pkgs.swaylock-effects;

    settings =
      catppuccin
      // {
        clock = true;
        daemonize = true;
        effect-blur = "7x5";
        fade-in = 1;
        image = "${self.images}/background.jpg";
        indicator = true;
        ring-color = "717df1";
      };
  };
}
