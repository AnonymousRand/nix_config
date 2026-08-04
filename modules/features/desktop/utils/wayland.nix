{
  den.aspects.features.desktop.utils.wayland = { systSettings }: {
    homeManager = { lib, pkgs, ... }: lib.mkIf (systSettings.capabilities.has [ "graphics" ]) {
      home.packages = [
        pkgs.hyprpicker   # color picker
        pkgs.wl-clipboard # wayland clipboard
      ];
    };
  };
}
