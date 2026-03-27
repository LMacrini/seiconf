inputs: let
  inherit (inputs.nixpkgs) lib;
in
  inputs.flake-parts.lib.mkFlake {inherit inputs;}
  {
    imports =
      lib.filesystem.listFilesRecursive ./modules
      |> builtins.filter (file: let
        f = toString file;
      in
        !lib.hasPrefix "_" (builtins.baseNameOf f)
        && lib.hasSuffix ".nix" f);
  }
