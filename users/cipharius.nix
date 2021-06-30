{ self, ... }:
{
  home-manager.users.cipharius = { suites, profiles, ... }: {
    imports = suites.base ++ (with profiles; [
      graphical.common
      kakoune
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
