{
  den.aspects.features.desktop.fcitx5 = {
    nixos = {
      i18n.inputMethod = {
        enable = true;
        type = "fcitx5";
      };
    };

    # this still needs to be set for fcitx5 to be configurable through home manager, although
    # only setting the home manager and not the nixos version also doesn't seem to work
    homeManager = { profileSettings, lib, ... }: {
      i18n.inputMethod = {
        enable = true;
        type = "fcitx5";
        fcitx5.waylandFrontend = (profileSettings.desktop.displayProtocol == "wayland");
      };
    };
  };
}
