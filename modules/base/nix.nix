{
  self,
  inputs,
  ...
}: {
  flake.file.inputs = {
    nur = {
      url = "github:nix-community/nur";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
      };
    };

    zig = {
      url = "github:silversquirl/zig-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  flake.nixosModules.base = {
    nixpkgs.overlays = [
      inputs.nur.overlays.default
      (final: prev: {
        prince = prev.nur.repos.forkprince;
      })
    ];

    environment.etc."programs.sqlite".source = "${inputs.nixpkgs}/programs.sqlite";

    nix = {
      channel.enable = false;

      optimise.automatic = true;

      registry = {
        config.flake = self;
        nixpkgs.flake = inputs.nixpkgs;
        zig.flake = inputs.zig;
      };

      settings = {
        experimental-features = "nix-command flakes pipe-operators";
        trusted-users = [
          "root"
          "lioma"
          "@wheel"
        ];

        keep-outputs = true; # direnv
        warn-dirty = false;
        builders-use-substitutes = true;
      };
    };
  };
}
