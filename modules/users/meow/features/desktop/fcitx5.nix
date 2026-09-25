{
  den.aspects.users.meow = {
    homeManager = {
      i18n.inputMethod.fcitx5 = {
        ignoreUserConfig = true;
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
        };
      };
    };
  };
}
