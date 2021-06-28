{ suites, lib, profiles, ... }:
{
  imports = suites.laptop ++ (with profiles; [
    network.ssh
  ]);

  fileSystems."/" = { device = "/dev/disk/by-label/nixos"; };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];

  networking.useDHCP = false;
  networking.interfaces.eno1.useDHCP = true;
  networking.interfaces.wlo1.useDHCP = true;

  time.timeZone = "Europe/Riga";

  powerManagement.cpuFreqGovernor = lib.mkDefault "performance";
  services.logind.lidSwitch = "ignore";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  nix.maxJobs = lib.mkDefault 4;

}
