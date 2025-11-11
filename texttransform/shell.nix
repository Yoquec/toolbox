{ pkgs, ... }:
pkgs.mkShellNoCC {
  packages = with pkgs; [
    go
    gopls
    golines
    gofumpt
    gosimports
  ];
}
