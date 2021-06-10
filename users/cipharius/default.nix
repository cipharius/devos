{ self, ... }:
{
  home-manager.users.cipharius = { suites, ... }: {
    imports = suites.base;
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
