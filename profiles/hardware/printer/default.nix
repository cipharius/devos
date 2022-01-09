{ pkgs, ... }: {
  services.printing.enable = true;
  services.printing.drivers = with pkgs; [
    gutenprint
    samsungUnifiedLinuxDriver
  ];
  nixpkgs.allowUnfreeWhitelist = [ "samsung-UnifiedLinuxDriver" ];
}
