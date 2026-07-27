{
  perSystem =
    { pkgs, ... }:
    let
      emacs = (pkgs.emacsPackagesFor pkgs.emacs-pgtk).withPackages (
        epkgs: with epkgs; [
          catppuccin-theme
          direnv
          marginalia
          meow
          nix-mode
          orderless
          projectile
          reformatter
          vertico
          zig-mode
        ]
      );
    in
    {
      packages = {
        inherit emacs;
      };
    };
}
