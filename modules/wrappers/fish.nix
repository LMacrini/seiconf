{ self, ... }:
{
  flake.wrappers.fish =
    {
      pkgs,
      system,
      inputs',
      wlib,
      ...
    }:
    let
    in
    {
      imports = [
        wlib.wrapperModules.fish
        self.nixosModules.inputs
      ];

      plugins = [
        inputs'.catppuccin.packages.fish
      ];

      runtimePkgs = with pkgs; [
        lsd
        nix-your-shell
        sqlite
        zoxide
      ];

      shellAliases = {
        cd = "z";
        ls = "lsd";
      };

      abbreviations = {
        ll = "ls -l";
        la = "ls -A";
        lt = "ls --tree";
        lla = "ls -lA";
        llt = "ls -l --tree";
        l = "ls -alh";

        tmpdir = {
          word = "!tmp";
          expansion = "(mktemp -d)";
          position = "anywhere";
        };
      };

      configFile.content = # fish
        ''
          fish_config theme choose catppuccin-macchiato

          nix-your-shell fish | source
          zoxide init fish | source

          if type -q direnv
            direnv hook fish | source
          end

          if type -q jj; and type -q git
            abbr --add git jj git
            abbr --add _git git
          end

          if set -q KITTY_INSTALLATION_DIR
            set --global KITTY_SHELL_INTEGRATION "no-rc no-cursor"
            source "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
            set --prepend fish_complete_path "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d"
          end

          function fish_command_not_found
            set program $argv[1]

            if not test -f /etc/programs.sqlite
              echo "$program: command not found" >&2
              return
            end

            set packages (
              sqlite3 -cmd ".parameter init" \
                  -cmd ".parameter set @program \"$program\"" \
                  /etc/programs.sqlite \
                  "select package from programs where name = @program and system = '${system}';" \
                  2>/dev/null
            )

            if test $status -ne 0
              echo "$program: command not found (programs database error)" >&2
              return
            end

            if test (count $packages) -eq 0
              echo "$program: command not found in PATH or in nixpkgs" >&2
              return
            else if test (count $packages) -eq 1
              echo "The program '$program' is not in your PATH. You can make it available in an" >&2
              echo "ephemeral shell by using the following package from nixpkgs:" >&2
              echo "  $packages[1]" >&2
              return
            end

            echo "The program '$program' is not in your PATH. It is provided by several packages." >&2
            echo "You can make it available in an ephemeral shell by using one of the following" >&2
            echo "packages from nixpkgs:" >&2
            for package in $packages
              echo "  $package" >&2
            end
          end

        '';
    };
}
