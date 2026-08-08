# WARN: AUTO-GENERATED FILE
# DO NOT MODIFY
{
  inputs = {
    catppuccin = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:catppuccin/nix?ref=release-26.05";
    };
    disko = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/disko";
    };
    flake-parts = {
      inputs.nixpkgs-lib.follows = "nixpkgs";
      url = "github:hercules-ci/flake-parts";
    };
    freesm = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:freesmteam/freesmlauncher";
    };
    hjem = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:feel-co/hjem";
    };
    impermanence = {
      inputs = {
        home-manager.follows = "";
        nixpkgs.follows = "";
      };
      url = "github:nix-community/impermanence";
    };
    mango = {
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
      };
      url = "github:mangowm/mango";
    };
    millennium = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:steamclienthomebrew/millennium?ref=next&dir=packages/nix";
    };
    nix-index-database = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/nix-index-database";
    };
    nixos-hardware = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nixos/nixos-hardware";
    };
    nixpkgs.url = "https://channels.nixos.org/nixos-26.05/nixexprs.tar.xz";
    prince = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:forkprince/nur-packages";
    };
    waybar = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:alexays/waybar?rev=084d87401d0a91182c16aa7e5f674a7dde767185";
    };
    wrappers = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:birdeehub/nix-wrapper-modules";
    };
    zig = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:silversquirl/zig-flake";
    };
  };

  outputs = inputs: import ./outputs.nix inputs;
}
