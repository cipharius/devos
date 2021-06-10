{ suites, ... }:
{
  imports = suites.base;

  users.users.root = {
    password = "";
    hashedPassword = null;
    passwordFile = null;
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  fileSystems."/" = { device = "/dev/disk/by-label/nixos"; };
}
