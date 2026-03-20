{
  flake.wrappers.jujutsu = {wlib, ...}: {
    imports = [wlib.wrapperModules.jujutsu];

    settings = {
      revsets = {
        # TODO: 26.05 use jj b a in my workflow
        bookmark-advance-to = "heads(::to & ~description(exact:'') & (~empty() | merges()))";
      };

      user = {
        email = "seijamail@duck.com";
        name = "Seija";
      };

      ui = {
        default-command = ["log" "--reversed"];
        diff-editor = ":builtin";
        paginate = "never";
      };
    };
  };
}
