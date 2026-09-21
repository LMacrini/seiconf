{
  lib,
  inputs,
  ...
}:
{
  flake.file.inputs = {
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    millennium = {
      url = "github:steamclienthomebrew/millennium?ref=next&dir=packages/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  flake.aspects.general = {
    deps = [
      "discord"
      "browser"
      "hjem"
    ];

    module =
      {
        pkgs,
        inputs',
        config,
        ...
      }:
      let
        prince = inputs'.prince.packages;
      in
      {
        imports = [
          inputs.nix-index-database.nixosModules.default
        ];

        environment.systemPackages = [
          prince.helium-nightly # TODO: 26.11 use nixpkgs helium
          prince.re-lunatic-player
          pkgs.celluloid
        ];

        programs = {
          command-not-found.enable = lib.mkForce false;
          nix-index-database.comma.enable = true;
          # steam.package = lib.mkDefault inputs'.millennium.packages.millennium-steam;
        };

        hjem.users.lioma = {
          packages = with pkgs; [
            direnv
            mpd
            rmpc
          ];

          xdg.config.files."direnv/direnv.toml" =
            let
              tomlFormat = pkgs.formats.toml { };
            in
            {
              source = tomlFormat.generate "direnv.toml" {
                global = {
                  log_format = "-";
                  log_filter = "^$";
                  warn_timeout = "0s";
                };
              };
            };
          xdg.config.files."direnv/lib/nix-direnv.sh".source = "${pkgs.nix-direnv}/share/nix-direnv/direnvrc";

          environment.sessionVariables = {
            COMMA_CACHING = 0; # i want it to ask me every time
          };

          files.".XCompose".text = ''
            include "%L"

            <Multi_key> <q> <e> <d> : "∎" U250E # END OF PROOF
            <Multi_key> <l> <asciitilde> : "ɫ" U026B # LATIN SMALL LETTER L WITH MIDDLE TILDE
            <Multi_key> <asciitilde> <l> : "ɫ" U026B # LATIN SMALL LETTER L WITH MIDDLE TILDE

            <Multi_key> <f> <n>			: "λ"	U03BB # GREEK SMALL LETTER LAMDA
            <Multi_key> <i> <f> <f> : "↔" U2194 # LEFT RIGHT ARROW
            <Multi_key> <n> <o> <t> : "¬" U00AC # NOT SIGN
            <Multi_key> <a> <n> <d> : "∧" U2227 # LOGICAL AND
            <Multi_key> <o> <r>     : "∨" U2228 # LOGICAL OR
            <Multi_key> <o> <plus>  : "⊕" U2295 # CIRCLED PLUS
            <Multi_key> <o> <p> <l> <u> <s> : "⊕" U2295 # CIRCLED PLUS

            <Multi_key> <l> <a> <n> : "⟨" U27E8 # MATHEMATICAL LEFT ANGLE BRACKET
            <Multi_key> <r> <a> <n> : "⟩" U27E9 # MATHEMATICAL RIGHT ANGLE BRACKET

            <Multi_key> <A> <l>     : "Α" U0391 # GREEK CAPITAL LETTER ALPHA
            <Multi_key> <a> <l>     : "α" U03B1 # GREEK SMALL LETTER ALPHA
            <Multi_key> <B> <t>     : "Β" U0392 # GREEK CAPITAL LETTER BETA
            <Multi_key> <b> <t>     : "β" U03B2 # GREEK SMALL LETTER BETA
            <Multi_key> <G> <a>     : "Γ" U0393 # GREEK CAPITAL LETTER GAMMA
            <Multi_key> <g> <a>     : "γ" U03B3 # GREEK SMALL LETTER GAMMA
            <Multi_key> <D> <e>     : "Δ" U0394 # GREEK CAPITAL LETTER DELTA
            <Multi_key> <d> <e>     : "δ" U03B4 # GREEK SMALL LETTER DELTA
            <Multi_key> <E> <p>     : "Ε" U0395 # GREEK CAPITAL LETTER EPSILON
            <Multi_key> <e> <p>     : "ε" U03B5 # GREEK SMALL LETTER EPSILON
            <Multi_key> <Z> <e>     : "Ζ" U0396 # GREEK CAPITAL LETTER ZETA
            <Multi_key> <z> <e>     : "ζ" U03B6 # GREEK SMALL LETTER ZETA
            <Multi_key> <E> <t>     : "Η" U0397 # GREEK CAPITAL LETTER ETA
            <Multi_key> <e> <t>     : "η" U03B7 # GREEK SMALL LETTER ETA
            <Multi_key> <T> <t>     : "Θ" U0398 # GREEK CAPITAL LETTER THETA
            <Multi_key> <t> <t>     : "θ" U03B8 # GREEK SMALL LETTER THETA
            <Multi_key> <M> <u>			: "Μ"	U039C # GREEK CAPITAL LETTER MU
            <Multi_key> <m> <u>			: "μ"	U03BC # GREEK SMALL LETTER MU
            <Multi_key> <N> <u>			: "Ν"	U039D # GREEK CAPITAL LETTER NU
            <Multi_key> <n> <u>			: "ν"	U03BD # GREEK SMALL LETTER NU
            <Multi_key> <P> <i>			: "Π"	U03A0 # GREEK CAPITAL LETTER PI
            <Multi_key> <p> <i>			: "π"	U03C0 # GREEK SMALL LETTER PI
            <Multi_key> <X> <i>			: "Ξ"	U039E # GREEK CAPITAL LETTER XI
            <Multi_key> <x> <i>			: "ξ"	U03BE # GREEK SMALL LETTER XI

            <Multi_key> <t> <o> <p> : "⊤" U22A4 # DOWN TACK
            <Multi_key> <p> <e> <r> <p> : "⊥" U22A5 # UP TACK
            <Multi_key> <f> <o> <r> <a> <l> <l> : "∀" U2200 # FOR ALL
            <Multi_key> <e> <x> <i> : "∃" U2203 # THERE EXISTS
            <Multi_key> <e> <q> <u> <i> <v> : "≡" U2261 # IDENTICAL TO

            <Multi_key> <n> <a> <t> : "ℕ" U2115 # DOUBLE-STRUCK CAPITAL N
            <Multi_key> <i> <n> <t> : "ℤ" U2124 # DOUBLE-STRUCK CAPITAL Z
            <Multi_key> <r> <a> <t> : "ℚ" U211A # DOUBLE-STRUCK CAPITAL Q
            <Multi_key> <r> <e> <a> : "ℝ" U211D # DOUBLE-STRUCK CAPITAL R
            <Multi_key> <c> <o> <m> : "ℂ" U2102 # DOUBLE-STRUCK CAPITAL C
          '';

          systemd =
            let
              mpd = rec {
                dataDir = "${config.hjem.users.lioma.xdg.data.directory}/mpd";
                playlistDir = "${dataDir}/playlists";

                port = 6600;
                address = "127.0.0.1";

                conf = pkgs.writeText "mpd.conf" ''
                  music_directory "${config.hjem.users.lioma.directory}/Music"
                  playlist_directory "${playlistDir}"
                  db_file "${dataDir}/tag_cache"
                  state_file "${dataDir}/state"
                  sticker_file "${dataDir}/sticker.sql"
                  bind_to_address "${address}"
                  auto_update "yes"

                  audio_output {
                    type "pipewire"
                    name "PipeWire Sound Server"
                  }
                '';
              };
            in
            {
              services = {
                mpd = {
                  description = "Music Player Daemon";
                  after = [
                    "network.target"
                    "sound.target"
                  ];

                  wantedBy = [
                    "default.target"
                  ];

                  restartTriggers = [
                    mpd.conf
                  ];

                  serviceConfig = {
                    ExecStart = "${lib.getExe pkgs.mpd} --no-daemon ${mpd.conf}";
                    Type = "notify";
                    ExecStartPre = ''${lib.getExe' pkgs.coreutils "mkdir"} -p "${mpd.dataDir}" "${mpd.playlistDir}"'';
                  };
                };
              };
            };
        };
      };
  };
}
