{
  lib,
  inputs,
  ...
}: {
  flake.nixosModules.base = {
    config,
    pkgs,
    ...
  }: {
    environment.systemPackages = let
      kanata = inputs.wrappers.lib.evalPackage [
        (
          {wlib, ...}: {
            imports = [wlib.modules.default];
            inherit pkgs;
            package = config.services.kanata.package;
            flags = {
              "-c" = "${config.services.kanata.keyboards.kanata.configFile}";
            };
          }
        )
      ];
    in [kanata];

    services.kanata = {
      enable = lib.mkDefault true;
      keyboards.kanata = {
        extraDefCfg =
          # kdb
          ''
            linux-dev-names-exclude (
              "ZSA Technology Labs Ergodox EZ"
              "ZSA Technology Labs Ergodox EZ Keyboard"
              "ZSA Technology Labs Ergodox EZ Consumer Control"
            )
            process-unmapped-keys false
          '';

        config =
          # kdb
          ''
            (defsrc
                 1    2    3                                       -    =
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


            (deflayer cmkdh
                 1    2    3                                       -    =
                  q    w    f    p    b    j    l    u    y    ;    [    ]
              bspc a    r    s    t    g    m    n    e    i    o    '
              lsft  x    c    d    v    z    k    h    ,    .    /    rsft
              lctl lmet lalt                           ralt @nav
            )

            (deflayer qwerty
                 1    2    3                                       -    =
                  q    w    e    r    t    y    u    i    o    p    [    ]
              caps a    s    d    f    g    h    j    k    l    ;    '
              lsft  z    x    c    v    b    n    m    ,    .    /    rsft
              lctl lmet lalt                           ralt @nav
            )

            (deftemplate hmod (key mod)
              (tap-hold 200 200 $key $mod)
            )

            (defalias
              g- (fork - ' (lsft rsft))
              g/ (fork / , (lsft rsft))
              g, (fork , / (lsft rsft))
              g' (fork ' - (lsft rsft))
              gn (t! hmod n lalt)
              gr (t! hmod r lmet)
              gt (t! hmod t lsft)
              gs (t! hmod s lctl)
              gh (t! hmod h rctl)
              ga (t! hmod a rsft)
              ge (t! hmod e rmet)
              gi (t! hmod i lalt)
            )

            (deflayer graphite
                 1    2    3                                       [    ]
                  b    l    d    w    z    @g'  f    o    u    j    ;    =
              bspc @gn  @gr  @gt  @gs  g    y    @gh  @ga  @ge  @gi  @g,
              lsft  q    x    m    c    v    k    p    .    @g-  @g/  rsft
              lctl lmet lalt                           ralt @nav
            )

            (defalias
              cmk (layer-switch cmkdh)
              qwe (layer-switch qwerty)
              gra (layer-switch graphite)
            )

            (deflayer swap
                 @cmk @qwe @gra                                    _    _
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
