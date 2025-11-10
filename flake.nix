{
  description = "Flake holding some random tools I use time to time";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default-linux";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };
  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;
      imports = [
        ./whichdate/flake-module.nix
        ./texttransform/flake-module.nix
        flake-parts.flakeModules.easyOverlay
      ];
    };
}
