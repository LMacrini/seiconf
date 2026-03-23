#!/usr/bin/env bash
nix run github:nix-community/nur#repos.rycee.mozilla-addons-to-nix \
        modules/features/browser/addons.json \
        modules/features/browser/_generated-addons.nix
nix fmt modules/features/browser/_generated-addons.nix
