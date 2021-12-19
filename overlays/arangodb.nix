final: prev: {
  arangodb = prev.arangodb.overrideAttrs (o: rec{
    version = "3.8.4.1";
    sha256 = "sha256-m9j23wAS6fJarO5kDdjoYn4D4+M3uAJb6xSY1/uBIOU=";

    src = prev.fetchFromGitHub {
      repo = "arangodb";
      owner = "arangodb";
      rev = "v${version}";
      inherit sha256;
    };

    nativeBuildInputs = with prev; [ cmake python3 perl which ];

    # prevent failing with "cmake-3.19.7/nix-support/setup-hook: line 10: ./3rdParty/rocksdb/RocksDBConfig.cmake.in: No such file or directory"
    dontFixCmake = true;
    NIX_CFLAGS_COMPILE = "-Wno-error -w";
    preConfigure = "patchShebangs utils";

    postPatch = ''
      sed -ie 's!/bin/echo!echo!' 3rdParty/V8/gypfiles/*.gypi

      # with nixpkgs, it has no sense to check for a version update
      substituteInPlace js/client/client.js --replace "require('@arangodb').checkAvailableVersions();" ""
      substituteInPlace js/server/server.js --replace "require('@arangodb').checkAvailableVersions();" ""
    '';
  });
}

