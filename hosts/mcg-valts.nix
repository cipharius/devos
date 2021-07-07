{ suites, lib, profiles, ... }:
{
  imports = suites.laptop ++ (with profiles; [
    docker
  ]);

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/2c251e55-0255-4ff4-89aa-07a5127b0748";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/3927-C499";
    fsType = "vfat";
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/fc051fc4-8ca6-48cf-a425-6e913c23ed51"; }
  ];

  boot.initrd.luks.devices = {
    "root".device = "/dev/disk/by-uuid/9a8fd4e3-3f40-4246-ab85-59a4e1b31b93";
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "usbhid" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];

  networking.useDHCP = false;
  networking.interfaces.enp1s0.useDHCP = true;
  networking.interfaces.wlp2s0.useDHCP = true;

  time.timeZone = "Europe/Riga";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  nix.maxJobs = lib.mkDefault 4;

}
