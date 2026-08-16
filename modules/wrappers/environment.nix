{
  lib,
  self,
  ...
}:
{
  flake.wrappers.environment =
    {
      self',
      pkgs,
      ...
    }:
    {
      imports = [ self.wrapperModules.nushell ];

      runtimePkgs = [
        pkgs.nix
        pkgs.nix-inspect
        pkgs.nix-output-monitor
        pkgs.nixd
        pkgs.nh
        self'.formatter

        pkgs.gitFull
        pkgs.bat
        pkgs.just
        pkgs.ripgrep
        pkgs.tlrc
        pkgs.rip2
        pkgs.p7zip
        pkgs.unzip
        pkgs.ffmpeg

        self'.packages.helix
        self'.packages.jujutsu
        self'.packages.qalc
      ];
      env = {
        EDITOR = lib.getExe self'.packages.helix;
        NH_SHOW_ACTIVATION_LOGS = "1";
        ZIG_BUILD_ERROR_STYLE = "minimal_clear";
      };
    };
}
