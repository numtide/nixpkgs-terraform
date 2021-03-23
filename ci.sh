#!/usr/bin/env bash
set -euo pipefail
NIX_PATH=nixpkgs=channel:nixos-unstable nix-build
