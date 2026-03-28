{
  lib,
  config,
  ...
}: {
  options.flake.file.inputs = let
    inherit (lib) mkOption types;

    followsOption = mkOption {
      default = null;
      type = types.nullOr types.str;
    };
    inputsFollowsOption = mkOption {
      default = null;
      type =
        types.nullOr
        <| types.lazyAttrsOf
        <| types.submodule {
          options = {
            follows = followsOption;
            inputs = inputsFollowsOption;
          };
        };
    };
  in
    mkOption {
      default = {};
      type =
        types.lazyAttrsOf
        <| types.submodule {
          options = {
            # NOTE: this is incomplete
            # will add more things when necessary
            url = mkOption {
              default = null;
              type = types.nullOr types.str;
            };
            follows = followsOption;
            inputs = inputsFollowsOption;
          };
        };
    };

  config.perSystem = {pkgs, ...}: let
    nixAttr = _name: value: let
      name = lib.strings.escapeNixIdentifier _name;
    in
      if builtins.isAttrs value && builtins.length (builtins.attrNames value) == 1
      then let
        nested = builtins.head (lib.mapAttrsToList nixAttr value);
      in {
        name = "${name}.${nested.name}";
        value = nested.value;
      }
      else {
        inherit name value;
      };

    nixCode = expr:
      if lib.isStringLike expr
      then lib.strings.escapeNixString expr
      else if builtins.isAttrs expr
      then
        expr
        |> lib.filterAttrsRecursive (name: value: !isNull value)
        |> lib.mapAttrsToList nixAttr
        |> map ({
          name,
          value,
        }: "${name} = ${
          nixCode value
        };")
        |> (attrs: "{${lib.concatStrings attrs}}")
      else if builtins.isList expr
      then map (expr: nixCode expr) expr |> (values: "[${builtins.concatStringsSep " " values}]")
      else if expr == true
      then "true"
      else if expr == false
      then "false"
      else toString expr;
  in {
    packages.flake = pkgs.writeText "flake.nix" ''
      # WARN: AUTO-GENERATED FILE
      # DO NOT MODIFY
      {
        inputs = ${nixCode config.flake.file.inputs};

        outputs = inputs: import ./outputs.nix inputs;
      }
    '';
  };
}
