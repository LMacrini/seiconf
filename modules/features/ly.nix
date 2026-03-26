{
  flake.aspects.ly.module = {
    services.displayManager.ly = {
      enable = true;
      settings = {
        animation = "gameoflife";
        bigclock = "en";
        ly_log = null;
      };
    };
  };
}
