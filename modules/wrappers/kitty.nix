{lib, ...}: {
  flake.wrappers.kitty = {
    wlib,
    pkgs,
    ...
  }: let
    format = pkgs.formats.keyValue {
      listsAsDuplicateKeys = true;
      mkKeyValue = lib.generators.mkKeyValueDefault {} " ";
    };
  in {
    imports = [wlib.modules.default];

    package = pkgs.kitty;

    flags = {
      "--config" = format.generate "kitty.conf" {
        include = "${pkgs.kitty-themes}/share/kitty-themes/themes/Catppuccin-Macchiato.conf";
        shell_integration = "no-rc no-cursor";
        allow_remote_control = "yes";
        confirm_os_window_close = 0;
        cursor_trail = 1;
        enable_audio_bell = "no";

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
