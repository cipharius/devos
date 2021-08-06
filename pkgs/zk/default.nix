{ pkgs, lib, sources, ... }:
let inherit (sources) zk; in
pkgs.buildGoModule {
  pname = "zk";
  inherit (zk) src version;
  vendorSha256 = "sha256-wP3ltbblyzA5bISvTqwnLkoupUCcfgQCRz6IdoFgjLc=";
  runVendor = true;
  buildInputs = with pkgs; [ icu.dev ];

  doCheck = false; # Handlebars template load fails

  meta = with lib; {
    description = "A plain text note-taking assistant";
    homepage = "https://github.com/mickael-menu/zk";
    license = licenses.gpl3;
    platforms = platforms.linux ++ platforms.darwin;
  };
}
