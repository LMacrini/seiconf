{
  inputs,
  self,
  ...
}:
{
  flake.file.inputs.impermanence = {
    url = "github:nix-community/impermanence";
    inputs = {
      home-manager.follows = "";
      nixpkgs.follows = "";
    };
  };

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
        inputs.impermanence.nixosModules.impermanence
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

        displayManager = {
          autoLogin = {
            enable = true;
            user = "lioma";
          };
        };
      };

      programs = {
        appimage = {
          enable = true;
          binfmt = true;
        };
        steam.enable = true;
      };

      hjem.users.lioma.packages = with pkgs; [
        inputs'.prince.packages.fluxer-stable-bin
        emacs-pgtk
        gearlever
        libreoffice
        signal-desktop
      ];

      networking.hostName = "amanojaku";
      system.stateVersion = "25.05";

      environment.persistence."/persist" = {
        enable = true; # default but i'll put it anyway
        directories = [
          "/etc/NetworkManager"
          "/var/db/sudo"
          "/var/lib/nixos"
        ];

        files = [
          "/etc/machine-id"
          "/etc/ssh/ssh_host_ed25519_key"
          "/etc/ssh/ssh_host_ed25519_key.pub"
          "/etc/ssh/ssh_host_rsa_key"
          "/etc/ssh/ssh_host_rsa_key.pub"
          "/var/lib/power-profiles-daemon/state.ini"
        ];
      };

      boot.initrd.systemd = {
        enable = true;
        services.rollback = {
          description = "Rollback BTRFS root subvolume to a clean state";
          wantedBy = [ "initrd.target" ];
          after = [ "systemd-cryptsetup@enc.service" ];
          before = [ "sysroot.mount" ];
          unitConfig.DefaultDependencies = "no";
          serviceConfig.Type = "oneshot";
          script = ''
            mkdir -p /mnt
            mount -o subvol=/ /dev/mapper/enc /mnt

            btrfs subvolume list -o /mnt/root |
              cut -f9 -d' ' |
              while read subvolume; do
                echo "deleting /$subvolume subvolume..."
                btrfs subvolume delete "/mnt/$subvolume"
              done &&
              echo "deleting /root subvolume..." &&
              btrfs subvolume delete /mnt/root
            echo "restoring blank /root subvolume..."
            btrfs subvolume snapshot /mnt/root-blank /mnt/root

            umount /mnt
          '';
        };
      };
    };
}
