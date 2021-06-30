{ pkgs, ... }: {

  # Dump of CLI packages without profiles
  environment.systemPackages = with pkgs; [
    ag
    curl
    dnsutils
    dolt
    file
    fzf
    ghc
    graphviz
    haskellPackages.neuron
    hledger
    htop
    imagemagick
    iw
    jq
    niv
    nixpkgs-fmt
    nix-prefetch
    nix-top
    nix-tree
    openconnect
    openssl
    pandoc
    patchelf
    pwgen
    python38
    ripgrep
    rsync
    stack
    tig
    tree
    units
    unzip
    wget
    whois
    zip
  ];

}
