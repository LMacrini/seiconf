{
  self,
  lib,
  ...
}: {
  flake.nixosConfigurations.DESKTOP-VKFSNVPI = self.lib.nixosSystem {
    aspects = [
      "general"
      "mango"
    ];
    module = self.nixosModules.DESKTOP-VKFSNVPI;
  };

  flake.nixosModules.DESKTOP-VKFSNVPI = {
    pkgs,
    inputs',
    config,
    ...
  }: {
    preferences = {
      monitors = {
        DP-1 = {
          x = 0;
          y = 0;
          width = 2560;
          height = 1440;
          scale = 1.0;
          refreshRate = 144.0;
        };

        HDMI-A-2 = {
          x = 2560;
          y = 180;
          width = 1920;
          height = 1080;
          scale = 1.0;
          refreshRate = 144.001;
        };
      };
    };

    boot.kernelPackages = pkgs.linuxPackages_zen;

    programs = {
      noisetorch.enable = true;
      steam.enable = true;
    };

    services = {
      cloudflare-warp.enable = true;
    };

    services.udev.extraRules = ''
      ACTION=="add", SUBSYSTEM=="sound", ENV{ID_VENDOR}=="SteelSeries", ENV{ID_MODEL}=="Arctis_Nova_3", TAG+="systemd", ENV{SYSTEMD_USER_WANTS}+="noisetorch-headset.service"
    '';
    hjem.users.lioma = {
      systemd.services.noisetorch-headset = let
        mic = "alsa_output.usb-SteelSeries_Arctis_Nova_3-00.analog-stereo";
      in {
        enable = true;
        description = "Run noisetorch on headset (udev triggered)";
        after = [
          "graphical-session.target"
          "sound.target"
        ];
        wants = [
          "sound.target"
        ];
        wantedBy = [
          "graphical-session.target"
        ];

        script = ''
          for i in {1..10}; do
            if ${lib.getExe' pkgs.pulseaudio "pactl"} list sources short | grep -q ${mic}; then
              ${lib.getExe config.programs.noisetorch.package} -i ${mic}
              break
            fi
            sleep 1
          done
        '';

        serviceConfig = {
          Type = "oneshot";
        };
      };
    };

    hjem.users.lioma.packages = [
      inputs'.prince.packages.fluxer-bin
    ];

    hardware = {
      amdgpu.opencl.enable = true;
      amdgpu.initrd.enable = true;
    };

    networking.hostName = "DESKTOP-VKFSNVPI";
    system.stateVersion = "24.11";
  };
}
