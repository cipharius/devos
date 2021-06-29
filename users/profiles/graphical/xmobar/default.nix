{ nixosConfig, pkgs, ... }: {
  home.packages = with pkgs; [ xmobar ];
  home.file = {
    ".xmobarrc".text = import ./xmobarrc.nix { inherit nixosConfig; };
  };
}
