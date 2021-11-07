{ pkgs, ... }: {
  home.packages = with pkgs; [
    (kakoune.override {
      configure = {
        plugins = with kakounePlugins; [
          kak-ansi
          prelude-kak
          connect-kak
        ];
      };
    })

    lf # For filetree script
    universal-ctags # For ctags integration
  ];

  home.file = {
    ".config/kak/kakrc".source = ./kakrc;
    ".config/kak/scripts/lf.kak".source = ./lf.kak;
  };
}
