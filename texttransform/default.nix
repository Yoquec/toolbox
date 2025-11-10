{ buildGoModule, go }:
buildGoModule.override { inherit go; } {
  name = "texttransform";
  pname = "tt";
  src = ./.;
  vendorHash = null;
}
