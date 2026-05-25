{
  flake.wrappers.jujutsu =
    {
      wlib,
      pkgs,
      ...
    }:
    {
      imports = [ wlib.wrapperModules.jujutsu ];

      settings = {
        revsets = {
          bookmark-advance-to = "heads(::@ & ~description(exact:'') & (~empty() | merges()))";
        };

        user = {
          email = "seijamail@duck.com";
          name = "Seija";
        };

        ui = {
          default-command = [
            "log"
            "--reversed"
          ];
          diff-editor = ":builtin";
          diff-formatter = "difft";
          paginate = "never";
        };
      };

      runtimePkgs = with pkgs; [
        difftastic
      ];
    };
}
