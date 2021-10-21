final: prev: {
  smos = prev.smos.overrideAttrs (o: rec{
    version = "0.3.1";

    src = final.pkgs.fetchurl {
      url = "https://github.com/NorfairKing/smos/releases/download/v${version}/smos-release.zip";
      sha256 = "sha256:07yavk7xl92yjwwjdig90yq421n8ldv4fjfw7izd4hfpzw849a12";
    };
  });
}
