{
  den.aspects.users.meow = {
    nixos = {
      i18n.extraLocales = [
        "zh_CN.UTF-8/UTF-8"
      ];
    };

    homeManager = { pkgs, ... }: {
      i18n.inputMethod.fcitx5 = {
        waylandFrontend = true;

        addons = [
          # `fcitx5-gtk` and `fcitx5-qt` allow GTK and QT apps respectively to use it for input
          pkgs.fcitx5-gtk
          pkgs.qt6Packages.fcitx5-qt
          # `fcitx5-chinese-addons` installs the actual pinyin etc. engines
          pkgs.qt6Packages.fcitx5-chinese-addons
        ];

        settings = {
          inputMethod = {
            GroupOrder = {
              "0" = "Default";
            };
            "Groups/0" = {
              Name = "Default";
              "Default Layout" = "us";
              DefaultIM = "keyboard-us";
            };
            "Groups/0/Items/0" = {
              Name = "keyboard-us";
            };
            "Groups/0/Items/1" = {
              Name = "pinyin";
            };
          };

          globalOptions = {
            "Hotkey/TriggerKeys" = {
              "0" = "Super+space";
            };
            "Hotkey/EnumerateGroupForwardKeys" = {
              "0" = "Control+space";
            };
            "Hotkey/EnumerateGroupBackwardKeys" = {
              "0" = "Shift+control+space";
            };
          };

          addons = {
            classicui.globalSection = {
              Theme = "noctalia_theme";
            };

            pinyin.globalSection = {
              CloudPinyinEnabled = "False";
            };
          };
        };
      };

      # noctalia theming
      batteries.theme.noctalia-theming.templates.fcitx5 = {
        input_path = builtins.toString ./dotfiles/themes/noctalia_theme.conf;
        output_path = "$XDG_DATA_HOME/fcitx5/themes/noctalia_theme/theme.conf";
      };
    };
  };
}
