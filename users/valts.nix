{ self, ... }:
{
  home-manager.users.valts = { suites, profiles, ... }: {
    imports = suites.base ++ (with profiles; [
      graphical.common
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
    extraGroups = [ "wheel" "networkmanager" "video" "input" "docker" ];
    passwordFile = "/run/secrets/valts";
  };
}
