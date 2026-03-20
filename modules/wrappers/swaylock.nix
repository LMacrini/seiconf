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

    swaylockConf =
      settings
      |> lib.mapAttrsToList (name: value:
        if lib.isBool value
        then lib.optional value name
        else ["${name}=${toString value}"])
      |> builtins.concatLists
      |> builtins.concatStringsSep "\n";
  in {
    imports = [
      wlib.modules.default
      self.nixosModules.inputs
    ];
    package = pkgs.swaylock-effects;
    flags = {
      "--config" = pkgs.writeText "config" <| swaylockConf;
    };
  };
}
