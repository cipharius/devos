{ self, ... }:
{
  home-manager.users.valts = { suites, profiles, ... }: {
    imports = suites.base ++ (with profiles; [
      graphical.common
      graphical.godot
      kakoune
      pijul
      smos
    ]);
  };

  age.secrets = {
    valts.file = "${self}/secrets/valts.age";
  };

  users.users.valts = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "input" "docker" "libvirtd" "scanner" "lp" ];
    passwordFile = "/run/agenix/valts";
  };
}
