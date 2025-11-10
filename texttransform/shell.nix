{ pkgs, ... }:
pkgs.mkShellNoCC {
  packages = with pkgs; [
    go
    gopls
    gofumpt
    gosimports
  ];
}
