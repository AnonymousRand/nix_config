{
  den.aspects.features.desktop.utils.wayland = {
    homeManager = { host, lib, pkgs, ... }: lib.optionalAttrs (host.capabilities.has [ "graphics" ]) {
      home.packages = [
        pkgs.hyprpicker   # color picker
        pkgs.wl-clipboard # wayland clipboard
      ];
    };
  };
}
