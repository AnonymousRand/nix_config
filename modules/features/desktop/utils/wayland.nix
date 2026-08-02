{
  den.aspects.features.desktop.utils.wayland = {
    homeManager = { syst, lib, pkgs, ... }:
      lib.optionalAttrs (syst.core.capabilities.has [ "graphics" ]) {
        home.packages = [
          pkgs.hyprpicker   # color picker
          pkgs.wl-clipboard # wayland clipboard
        ];
      };
  };
}
