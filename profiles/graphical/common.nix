{ pkgs, lib, ... }: {
  imports = [ ./xserver ];

  nixpkgs.config.allowUnfreeWhitelist = [
    "spotify"
    "spotify-unwrapped"
    "teams"
    "zoom"
    "faac" # required for zoom
    "steam"
    "steam-original"
    "steam-runtime"
  ];

  # Dump of graphical packages without profiles
  environment.systemPackages = with pkgs; [
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
