{
  self,
  lib,
  ...
}:
{
  flake.file.inputs.freesm = {
    url = "github:freesmteam/freesmlauncher";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.nixosConfigurations.DESKTOP-VKFSNVPI = self.lib.nixosSystem {
    aspects = [
      "general"
      "mango"
    ];
    module = self.nixosModules.DESKTOP-VKFSNVPI;
  };

  flake.nixosModules.DESKTOP-VKFSNVPI =
    {
      pkgs,
      inputs',
      config,
      ...
    }:
    {
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

      users.users.lioma.extraGroups = [
        "plugdev"
      ];

      # https://github.com/zsa/wally/wiki/Linux-install
      services.udev.extraRules = ''
        # Rules for Oryx web flashing and live training
        KERNEL=="hidraw*", ATTRS{idVendor}=="16c0", MODE="0664", GROUP="plugdev"
        KERNEL=="hidraw*", ATTRS{idVendor}=="3297", MODE="0664", GROUP="plugdev"

        # Legacy rules for live training over webusb (Not needed for firmware v21+)
          # Rule for all ZSA keyboards
          SUBSYSTEM=="usb", ATTR{idVendor}=="3297", GROUP="plugdev"
          # Rule for the Moonlander
          SUBSYSTEM=="usb", ATTR{idVendor}=="3297", ATTR{idProduct}=="1969", GROUP="plugdev"
          # Rule for the Ergodox EZ
          SUBSYSTEM=="usb", ATTR{idVendor}=="feed", ATTR{idProduct}=="1307", GROUP="plugdev"
          # Rule for the Planck EZ
          SUBSYSTEM=="usb", ATTR{idVendor}=="feed", ATTR{idProduct}=="6060", GROUP="plugdev"

        # Wally Flashing rules for the Ergodox EZ
        ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04[789B]?", ENV{ID_MM_DEVICE_IGNORE}="1"
        ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04[789A]?", ENV{MTP_NO_PROBE}="1"
        SUBSYSTEMS=="usb", ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04[789ABCD]?", MODE:="0666"
        KERNEL=="ttyACM*", ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04[789B]?", MODE:="0666"

        # Keymapp / Wally Flashing rules for the Moonlander and Planck EZ
        SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="df11", MODE:="0666", SYMLINK+="stm32_dfu"
        # Keymapp Flashing rules for the Voyager
        SUBSYSTEMS=="usb", ATTRS{idVendor}=="3297", MODE:="0666", SYMLINK+="ignition_dfu"

        ACTION=="add", SUBSYSTEM=="sound", ENV{ID_VENDOR}=="SteelSeries", ENV{ID_MODEL}=="Arctis_Nova_3", TAG+="systemd", ENV{SYSTEMD_USER_WANTS}+="noisetorch-headset.service"
      '';
      hjem.users.lioma = {
        systemd.services.noisetorch-headset =
          let
            mic = "alsa_output.usb-SteelSeries_Arctis_Nova_3-00.analog-stereo";
          in
          {
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
        inputs'.freesm.packages.default
      ];

      hardware = {
        amdgpu.opencl.enable = true;
        amdgpu.initrd.enable = true;
      };

      networking.hostName = "DESKTOP-VKFSNVPI";
      system.stateVersion = "24.11";
    };
}
