{ ... }: {
  services.hledger-web.enable = true;
  services.hledger-web.port = 5000;
  services.hledger-web.capabilities = {
      view = true;
      add = true;
      manage = true;
  };
}
