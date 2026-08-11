{
  lib,
  self,
  ...
}:
{
  flake.wrappers.swaylock =
    {
      pkgs,
      wlib,
      inputs',
      ...
    }:
    let
      merger = pkgs.writers.writeNuBin "merge" ''
        def parse-file [file] {
          open $file | lines | parse --regex '(?<name>.*)(?:=(?<value>.*))?' | transpose --header-row | into record
        }

        def main [first second output] {
          let first = parse-file $first
          let second = parse-file $second
          let result = $first | merge $second | sort | transpose k v | each {|it|
            if ($it.v | is-empty) {
              $"($it.k)"
            } else {
              $"($it.k)=($it.v)"
            }
          } | str join "\n"
          $result | save $output
        }
      '';

      config = pkgs.runCommand "swaylock.conf" {
        nativeBuildInputs = [ merger ];
        catppuccin = "${inputs'.catppuccin.packages.swaylock}/macchiato.conf";
        custom = pkgs.writeText "custom.conf" (
          builtins.concatStringsSep "\n" (
            lib.mapAttrsToList (name: value: if value == true then name else "${name}=${toString value}") {
              clock = true;
              daemonize = true;
              effect-blur = "7x5";
              fade-in = 1;
              image = "${self.images}/background.jpg";
              indicator = true;
              ring-color = "717df1";
            }
          )
        );
      } ''merge "$catppuccin" "$custom" "$out"'';
    in
    {
      imports = [
        wlib.modules.default
        self.nixosModules.inputs
      ];
      package = pkgs.swaylock-effects;

      flags."--config" = config;
    };
}
