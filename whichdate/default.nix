{ stdenv, ghc, ... }:
let
  pname = "whichdate";
  binaryName = "wd";
in
stdenv.mkDerivation {
  inherit pname;
  version = "0.1.0";
  src = ./.;
  buildInputs = [ ghc ];
  buildPhase = ''
    ${ghc}/bin/ghc -o ${pname} src/Main.hs
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp ${pname} $out/bin/${binaryName}
  '';
  license = stdenv.lib.licenses.gpl3;
}
