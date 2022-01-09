channels: final: prev: {

  __dontExport = true; # overrides clutter up actual creations

  inherit (channels.latest)
    cachix
    deploy-rs
    dhall
    discord
    element-desktop
    kakoune
    nixpkgs-fmt
    qutebrowser
    rage
    signal-desktop
    starship
    ;

  inherit (channels.bleeding-edge)
    paperless-ng
    ;

  python3Packages = prev.python3Packages.override
    (old: {
        overrides = prev.lib.composeExtensions (old.overrides or (_: _: { })) (_: _:
        {
            inherit (channels.bleeding-edge.python3Packages)
              gunicorn;
        });
    });


  haskellPackages = prev.haskellPackages.override
    (old: {
      overrides = prev.lib.composeExtensions (old.overrides or (_: _: { })) (hfinal: hprev:
        let version = prev.lib.replaceChars [ "." ] [ "" ] prev.ghc.version;
        in
        {
          # same for haskell packages, matching ghc versions
          inherit (channels.latest.haskell.packages."ghc${version}")
            haskell-language-server;
        });
    });
}
