set quiet := true

default: flake

addons:
    nix run github:nix-community/nur#repos.rycee.mozilla-addons-to-nix \
        modules/features/browser/addons.json \
        modules/features/browser/_generated-addons.nix
    nix fmt modules/features/browser/_generated-addons.nix

bootstrap: && flake
    cp ./bootstrap.nix ./flake.nix

# TODO: nix-auto-follow maybe
flake:
    cp $(nix build .#flake --no-link --print-out-paths --no-write-lock-file) ./flake.nix
    chmod 644 ./flake.nix
    nix fmt ./flake.nix

iso:
    nom build .#iso

update *FLAKES:
    nix flake update {{FLAKES}}
