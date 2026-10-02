{ lib, self, ... }:
{
  flake.wrappers.kitty =
    {
      wlib,
      pkgs,
      self',
      ...
    }:
    let
      format = pkgs.formats.keyValue {
        listsAsDuplicateKeys = true;
        mkKeyValue = lib.generators.mkKeyValueDefault { } " ";
      };
    in
    {
      imports = [
        wlib.modules.default
        self.nixosModules.inputs
      ];

      package = pkgs.kitty;
      runtimePkgs = [
        self'.packages.ioseika
      ];

      flags = {
        "--config" = format.generate "kitty.conf" {
          include = "${pkgs.kitty-themes}/share/kitty-themes/themes/Catppuccin-Macchiato.conf";
          shell_integration = "no-cursor";
          allow_remote_control = "no";
          confirm_os_window_close = 0;
          enable_audio_bell = "no";

          font_family = "family=Ioseika";
          font_size = 12.0;

          tab_bar_style = "powerline";
          tab_powerline_style = "angled";

          auto_reload_config = -1;

          map = [
            "kitty_mod+enter launch --cwd=current"
            "kitty_mod+t new_tab"

            # 26.05
            # "ctrl+a>a goto_session ~/sesh/"
          ];
        };
      };
    };
}
