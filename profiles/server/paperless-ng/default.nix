{ ... }: {
  services.paperless.enable = true;
  services.paperless.package = "pkgs.paperless-ng";
  services.paperless.port = 28981;
  services.paperless.ocrLanguages = [ "eng" "lav" ];
  services.paperless.extraConfig = {
    PAPERLESS_AUTO_LOGIN_USERNAME = "admin";
  };
}
