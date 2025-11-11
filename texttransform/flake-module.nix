{
  perSystem =
    { pkgs, ... }:
    let
      texttransform = pkgs.callPackage ./. { };
    in
    {
      overlayAttrs = { inherit texttransform; };
      packages = { inherit texttransform; };
      devShells.texttransform = pkgs.callPackage ./shell.nix { };
    };
}
