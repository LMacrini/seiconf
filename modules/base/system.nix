{lib, ...}: {
  flake.nixosModules.base = {
    system.nixos = {
      distroId = "seios";
      distroName = "SeiOS";
      vendorId = "seios";
      vendorName = "SeiOS";
    };

    programs.nh = {
      enable = true;
      clean = {
        enable = true;
        dates = "daily";
        extraArgs = lib.mkDefault "--keep 5 --keep-since 14d";
      };
    };
  };
}
