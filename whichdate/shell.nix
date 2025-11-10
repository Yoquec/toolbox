{ pkgs, ... }:
pkgs.mkShellNoCC {
  packages = with pkgs; [
    ghc
    haskell-language-server
  ];
}
