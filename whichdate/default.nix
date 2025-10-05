{
  lib,
  stdenv,
  ghc,
  ...
}:
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
  meta = {
    description = "CLI tool that turns natural language relative dates into timestamps.";
    homepage = "https://github.com/yoquec/toolbox";
    license = lib.licenses.gpl3;
  };
}
