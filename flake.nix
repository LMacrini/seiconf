# WARN: AUTO-GENERATED FILE
# DO NOT MODIFY
{
  inputs = {
    catppuccin = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:catppuccin/nix/release-25.11";
    };
    disko = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/disko";
    };
    flake-parts = {
      inputs.nixpkgs-lib.follows = "nixpkgs";
      url = "github:hercules-ci/flake-parts";
    };
    hjem = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:feel-co/hjem";
    };
    hjem-rum = {
      inputs = {
        hjem.follows = "hjem";
        nixpkgs.follows = "nixpkgs";
      };
      url = "github:snugnug/hjem-rum";
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
      url = "github:steamclienthomebrew/millennium?dir=packages/nix";
    };
    nix-index-database = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/nix-index-database";
    };
    nixos-hardware.url = "github:nixos/nixos-hardware";
    nixpkgs.url = "https://channels.nixos.org/nixos-25.11/nixexprs.tar.xz";
    nur = {
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
      };
      url = "github:nix-community/nur";
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
