{
  inputs,
  self,
  ...
}:
{
  flake.nixosConfigurations.amanojaku = self.lib.nixosSystem {
    aspects = [
      "general"
      "mango"
    ];
    module = self.nixosModules.amanojaku;
  };

  flake.nixosModules.amanojaku =
    {
      pkgs,
      inputs',
      ...
    }:
    {
      imports = [
        inputs.nixos-hardware.nixosModules.framework-amd-ai-300-series
      ];

      virtualisation.libvirtd.enable = true;
      programs.virt-manager.enable = true;

      users.users.lioma.extraGroups = [
        "dialout"
        "libvirtd"
      ];

      preferences = {
        laptop.enable = true;
        monitors = {
          eDP-1 = {
            width = 2880;
            height = 1920;
            refreshRate = 120.0;
            scale = 2.0;
          };
        };
      };

      nixpkgs.config.allowUnfree = true;

      services = {
        cloudflare-warp.enable = true;
        flatpak.enable = true;
        openssh.enable = true;
      };

      programs = {
        appimage = {
          enable = true;
          binfmt = true;
        };
        steam.enable = true;
      };

      hjem.users.lioma.packages = with pkgs; [
        inputs'.prince.packages.fluxer-bin
        arduino
        emacs-pgtk
        gearlever
        libreoffice
      ];

      networking.hostName = "amanojaku";
      system.stateVersion = "25.05";
    };
}
