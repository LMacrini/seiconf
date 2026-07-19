{ self, lib, ... }: {
  flake.wrappers.nushell =
    {
      pkgs,
      wlib,
      inputs',
      system,
      ...
    }:
    let
      source = name: cmd: "source ${pkgs.runCommand name { } "${cmd} >> $out"}";
    in
    {
      imports = [
        wlib.wrapperModules.nushell
        self.nixosModules.inputs
      ];
      runtimePkgs = with pkgs; [
        nix-your-shell
        zoxide
      ];

      "config.nu".content =
        # nu
        ''
          $env.config.show_banner = false

          $env.PROMPT_COMMAND_RIGHT = ""

          $env.PROMPT_INDICATOR = $"(ansi white)>(ansi reset) "
          $env.PROMPT_COMMAND = {
            let user = (ansi cyan)(whoami)
            let hostname = (ansi blue)(sys host | get hostname)
            $"($user)(ansi white)@($hostname)(ansi reset) (ansi yellow)(prompt_pwd)(ansi reset)"
          }

          $env.config.hooks.env_change.PWD = [{||
            if (which direnv | is-empty) {
              return
            }

            use std/config env-conversions
            direnv export json | from json | default {} | load-env
            $env.PATH = do (env-conversions).path.from_string $env.PATH
          }]

          # TODO: 26.11
          # $env.config.abbreviations = {
          #   ll: ls -l
          #   la: ls -A
          #   lt: ls --tree
          #   lla: ls -lA
          #   llt: ls -l --tree
          #   l: ls -alh
          #   rmt: gio trash
          # }
          # figure out conditional jj git abbrs

          source ${inputs'.catppuccin.packages.nushell + /catppuccin_macchiato.nu}
          ${source "nix-your-shell.nu" "${lib.getExe pkgs.nix-your-shell} nushell"}
          ${source "zoxide-nushell-config.nu" "${lib.getExe pkgs.zoxide} init nushell"}

          def prompt_pwd [
            --dir-length (-d): int = 1 # Length of shortened directories
            --full-dir-length (-D): int = 1 # Number of directories kept at full length
          ]: nothing -> string {
            let home = $nu.home-dir | path split
            let pwd = pwd | path split

            let home_length = $home | length

            let parts = if ($pwd | first $home_length) == $home {
              ["~"] ++ ($pwd | skip $home_length)
            } else {
              $pwd
            }

            $parts
            | enumerate
            | each {|it|
              let remaining = ($parts | length) - $it.index

              if ($it.item in ["~", "/"]) {
                $it.item
              } else if ($remaining > $full_dir_length) {
                $it.item | str substring 0..<$dir_length
              } else {
                $it.item
              }
            } | path join
          }

          def find-command [command: string]: nothing -> list<string> {
            if not ("/etc/programs.sqlite" | path exists) {
              print --stderr "programs database not found (/etc/programs.sqlite)"
              return
            }

            let packages = open /etc/programs.sqlite
              | get programs
              | where name == $command and system == ${system}
              | get package


            print --stderr $"The command '($command)' was found in the following packages from nixpkgs:"
            $packages
          }
        '';
    };
}
