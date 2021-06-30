{ ... }: {
  imports = [ ./xserver ];

  # Dump of graphical packages without profiles
  environment.systemPackages = [
    chromium
    feh
    gimp
    inkscape
    libreoffice
    paraview
    pavucontrol
    spotify
    steam
    teams
    transmission-qt
    virt-manager
    vlc
    xsel
    zathura
    zoom-us
  ];
}
