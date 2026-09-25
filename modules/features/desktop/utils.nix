{
  den.aspects.features.desktop.utils = {
    homeManager = { systSettings, profileSettings, lib, pkgs, ... }:
      lib.mkIf (systSettings.capabilities.has [ "graphics" ]) (lib.mkMerge [
        # for all display protocols
        {}

        # for wayland only
        lib.optionalAttrs (profileSettings.desktop.displayProtocol == "wayland") {
          home.packages = [
            pkgs.hyprpicker   # color picker
            pkgs.wl-clipboard # clipboard
          ];
        }

        # for x11 only
        lib.optionalAttrs (profileSettings.desktop.displayProtocol == "x11") {
          home.packages = [
            pkgs.xclip  # clipboard
            pkgs.xcolor # color picker
          ];
        }
      ]);
  };
}
