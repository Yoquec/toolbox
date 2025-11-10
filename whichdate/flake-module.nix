{
  perSystem =
    { pkgs, ... }:
    {
      packages.whichdate = pkgs.callPackage ./. { };
      devShells.whichdate = pkgs.callPackage ./shell.nix { };
    };
}
