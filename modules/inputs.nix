{
  flake.file.inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-26.05/nixexprs.tar.xz";
    nixos-hardware.url = "github:nixos/nixos-hardware";

    catppuccin = {
      url = "github:catppuccin/nix?ref=release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    prince = {
      url = "github:forkprince/nur-packages";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wrappers = {
      url = "github:birdeehub/nix-wrapper-modules";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
