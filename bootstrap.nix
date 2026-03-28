{
  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-25.11/nixexprs.tar.xz";
    flake-parts = {
      inputs.nixpkgs-lib.follows = "nixpkgs";
      url = "github:hercules-ci/flake-parts";
    };
    wrappers = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:birdeehub/nix-wrapper-modules";
    };
  };

  outputs = inputs: import ./outputs.nix inputs;
}
