{
  description = "Flake holding some random tools I use time to time";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default-linux";
    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
    };
  };
  outputs =
    { systems, ... }@inputs:
    inputs.flake-utils.lib.eachSystem (import systems) (
      system:
      let
        pkgs = inputs.nixpkgs.legacyPackages.${system};
        whichdate = pkgs.callPackage ./whichdate/default.nix { };
      in
      {
        packages = {
          inherit whichdate;
        };

        apps = {
          whichdate = {
            type = "app";
            program = "${whichdate}/bin/wd";
          };
        };

        devShells = {
          haskell = pkgs.mkShell {
            packages = with pkgs; [
              ghc
              haskell-language-server
            ];
          };
        };

        overlays.default = _: _: {
          inherit whichdate;
        };
      }
    );
}
