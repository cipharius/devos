{ pkgs, ... }: {
  home.packages = with pkgs; [ xmobar ];
  home.file = {
    ".xmobarrc".source = ./xmobarrc;
  };
}
