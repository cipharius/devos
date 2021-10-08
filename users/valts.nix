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
    uid = 1000;
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "input" "docker" "libvirtd" ];
    passwordFile = "/run/secrets/valts";
  };
}
