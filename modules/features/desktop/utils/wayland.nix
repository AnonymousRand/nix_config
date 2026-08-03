{
  den.aspects.features.desktop.utils.wayland = {
    homeManager = { core, lib, pkgs, ... }:
      lib.mkIf (core.capabilities.has [ "graphics" ]) {
        home.packages = [
          pkgs.hyprpicker   # color picker
          pkgs.wl-clipboard # wayland clipboard
        ];
      };
  };
}
