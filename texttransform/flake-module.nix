{
  perSystem =
    { pkgs, ... }:
    {
      packages.texttransform = pkgs.callPackage ./. { };
      devShells.texttransform = pkgs.callPackage ./shell.nix { };
    };
}
