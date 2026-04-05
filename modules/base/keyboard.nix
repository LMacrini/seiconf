{
  lib,
  inputs,
  ...
}:
{
  flake.nixosModules.base =
    {
      config,
      pkgs,
      ...
    }:
    {
      environment.systemPackages =
        let
          kanata = inputs.wrappers.lib.evalPackage [
            (
              { wlib, ... }:
              {
                imports = [ wlib.modules.default ];
                inherit pkgs;
                package = config.services.kanata.package;
                flags = {
                  "-c" = "${config.services.kanata.keyboards.kanata.configFile}";
                };
              }
            )
          ];
        in
        [ kanata ];

      services.kanata = {
        enable = lib.mkDefault true;
        keyboards.kanata = {
          extraDefCfg = # kdb
            ''
              linux-dev-names-exclude (
                "ZSA Technology Labs Ergodox EZ"
                "ZSA Technology Labs Ergodox EZ Keyboard"
                "ZSA Technology Labs Ergodox EZ Consumer Control"
              )
              process-unmapped-keys false
            '';

          config = # kdb
            ''
              (defsrc
                   1    2                                            -    =
                    q    w    e    r    t    y    u    i    o    p    [    ]
                caps a    s    d    f    g    h    j    k    l    ;    '
                lsft  z    x    c    v    b    n    m    ,    .    /    rsft
                lctl lmet lalt                           ralt rctl
              )


              (defalias
                nav (multi
                  rctrl
                  (layer-while-held swap)
                )
              )

              (deftemplate hmod (key mod)
                (tap-hold 200 200 $key $mod)
              )

              (deflayer cmkdh
                   1    2                                            -    =
                    q    w    f    p    b    j    l    u    y    ;    [    ]
                bspc a    r    s    t    g    m    n    e    i    o    '
                lsft  x    c    d    v    z    k    h    ,    .    /    rsft
                lctl lmet lalt                           ralt @nav
              )

              (deflayer qwerty
                   1    2                                            -    =
                    q    w    e    r    t    y    u    i    o    p    [    ]
                caps a    s    d    f    g    h    j    k    l    ;    '
                lsft  z    x    c    v    b    n    m    ,    .    /    rsft
                lctl lmet lalt                           ralt @nav
              )

              (defalias
                cmk (layer-switch cmkdh)
                qwe (layer-switch qwerty)
              )

              (deflayer swap
                   @cmk @qwe                                         _    _
                    _    _    _    _    _    _    _    _    _    _    _    _
                _    _    _    _    _    _    _    _    _    _    _    _
                _     _    _    _    _    _    _    _    _    _    _    _
                _    _    _                              _    XX
              )
            '';
        };
      };
    };
}
