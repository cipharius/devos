{ self, lib, ... }:
{
  age.secrets = {
    root.file = "${self}/secrets/root.age";
  };

  users.users.root.passwordFile = lib.mkDefault "/run/secrets/root";
}
