{ pkgs, ... }:
{
  virtualisation.libvirtd = {
    enable = true;
    qemuPackage = pkgs.qemu_kvm;
  };
}
