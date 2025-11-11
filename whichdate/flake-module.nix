{
  perSystem =
    { pkgs, ... }:
    let
      whichdate = pkgs.callPackage ./. { };
    in
    {
      overlayAttrs = { inherit whichdate; };
      packages = { inherit whichdate; };
      devShells.whichdate = pkgs.callPackage ./shell.nix { };
    };
}
