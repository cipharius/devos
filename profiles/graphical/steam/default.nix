{ pkgs, ... }: {
  programs.steam.enable = true;

  nixpkgs.config.packageOverrides = pkgs: {
    steam = pkgs.steam.override {
      extraPkgs = pkgs: with pkgs; [
        xlibs.libXcursor
        xlibs.libXinerama
        xlibs.libXi
        xlibs.libXScrnSaver
        libpulseaudio
        libpng
        libvorbis
      ];
    };
  };
}
