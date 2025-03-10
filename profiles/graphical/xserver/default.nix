{ pkgs, ... }: {
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.opengl.driSupport32Bit = true;

  services.xserver = {
    enable = true;
    libinput.enable = true;
    displayManager.lightdm.enable = true;

    # Allow home manager to provide window manager
    desktopManager.session = [
      {
        name = "home-manager";
        start = ''
          ${pkgs.runtimeShell} $HOME/.hm-xsession &
          waitPID=$!
        '';
      }
    ];
  };
}
