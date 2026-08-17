inputs:
let
  inherit (inputs.nixpkgs) lib;
in
inputs.flake-parts.lib.mkFlake { inherit inputs; } {
  imports =
    lib.filesystem.listFilesRecursive ./modules
    |> builtins.filter (
      file:
      let
        f = baseNameOf file;
      in
      !lib.hasPrefix "_" f && lib.hasSuffix ".nix" f
    );
}
