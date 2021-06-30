{ self, ... }:
{
  home-manager.users.cipharius = { suites, profiles, ... }: {
    imports = suites.base ++ (with profiles; [
      graphical.common
      kakoune
      pijul
    ]);
  };

  age.secrets = {
    cipharius.file = "${self}/secrets/cipharius.age";
  };

  users.users.cipharius = {
    uid = 1000;
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    passwordFile = "/run/secrets/cipharius";
  };
}
