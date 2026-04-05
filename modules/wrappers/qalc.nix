{
  flake.wrappers.qalc =
    {
      pkgs,
      wlib,
      inputs',
      ...
    }:
    {
      imports = [ wlib.modules.default ];
      package = pkgs.libqalculate;
      flags = {
        "-s" = "autocalc";
      };
    };
}
