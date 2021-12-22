{ suites, lib, profiles, ... }:
{
  imports = suites.server;

  fileSystems."/" = { device = "/dev/disk/by-label/nixos"; };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];

  networking.useDHCP = false;
  networking.interfaces.eno1.useDHCP = false;
  networking.interfaces.wlo1.useDHCP = false;
  networking.interfaces.wlo1.ipv4.addresses = [{
    address = "192.168.8.10";
    prefixLength = 24;
  }];
  networking.defaultGateway = "192.168.8.1";
  networking.nameservers = [
    "194.8.2.2"
    "9.9.9.9"
    "8.8.8.8"
  ];

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
