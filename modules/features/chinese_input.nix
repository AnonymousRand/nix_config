{
  den.aspects.features.chinese-input = {
    nixos = { pkgs, ... }: {
      i18n = {
        extraLocales = [
          "zh_CN.UTF-8/UTF-8"
        ];

        inputMethod = {
          enable = true;
          type = "fcitx5";
          fcitx5 = {
            waylandFrontend = true;

            addons = [
              # `fcitx5-gtk` and `fcitx5-qt` allow GTK and QT apps respectively to use it for input
              pkgs.fcitx5-gtk
              pkgs.qt6Packages.fcitx5-qt
              # `fcitx5-chinese-addons` installs the actual pinyin etc. engines
              pkgs.qt6Packages.fcitx5-chinese-addons
            ];
          };
        };
      };
    };

    # this still needs to be set for fcitx5 to be configurable through home manager, although
    # only setting the home manager and not the nixos version also doesn't seem to work
    homeManager = {
      i18n.inputMethod = {
        enable = true;
        type = "fcitx5";
      };
    };
  };
}
