{
  lib,
  inputs,
  self,
  ...
}: {
  imports = [inputs.wrappers.flakeModules.wrappers];

  options = with lib; {
    flake = {
      aspects = mkOption {
        type =
          types.lazyAttrsOf
          <| types.submodule {
            options = {
              deps = mkOption {
                default = [];
                type = types.listOf types.str;
              };

              module = mkOption {
                type = types.deferredModule;
              };
            };
          };
      };

      hjemModules = mkOption {
        type = types.lazyAttrsOf types.deferredModule;
        default = {};
      };
    };
  };

  config = {
    systems = [
      "x86_64-linux"
    ];

    flake.nixosModules.inputs = {pkgs, ...}: {
      config._module.args = rec {
        system = pkgs.stdenvNoCC.hostPlatform.system;

        inputs' = builtins.mapAttrs (_: flake:
          self.lib.makePrime flake system)
        inputs;

        self' = self.lib.makePrime self system;
      };
    };
  };
}
