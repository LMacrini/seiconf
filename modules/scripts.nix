{ lib, ... }:
{
  perSystem =
    {
      inputs',
      pkgs,
      ...
    }:
    {
      packages = {
        install = pkgs.writeShellScriptBin "install" ''
          exec ${lib.getExe inputs'.disko.packages.disko-install} --write-efi-boot-entries --flake $1 --disk main $2
        '';

        screenshot =
          pkgs.writers.writeNuBin "screenshot"
            #nu
            ''
              let pipe = $"(mktemp --dry).fifo"
              mkfifo $pipe
              let wayfreeze_job = job spawn {
                wayfreeze --hide-cursor --after-freeze-timeout 100 --after-freeze-cmd $"echo > ($pipe)"
              }
              open --raw $pipe
              try {
                let selection = slurp -dw 0 e> /dev/null
                grim -g $selection - | wl-copy
              }
              job kill $wayfreeze_job
              rm --force $pipe
            '';
      };
    };
}
