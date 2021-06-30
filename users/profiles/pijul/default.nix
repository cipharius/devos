{ pkgs, ... }: {
  home.packages = with pkgs; [ pijul ];

  home.file = {
    ".config/pijul/config.toml".source = ./config.toml;
  };
}
