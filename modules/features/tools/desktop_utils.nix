{
  den.aspects.features.tools.desktop-utils = {
    homeManager = { syst, profile, lib, pkgs, ... }:
      lib.mkIf (syst.settings.capabilities.has [ "graphics" ]) (lib.mkMerge [
        # for all display protocols
        {}

        # for wayland only
        (lib.optionalAttrs (profile.settings.desktop.displayProtocol == "wayland") {
          home.packages = [
            pkgs.hyprpicker   # color picker
            pkgs.wl-clipboard # clipboard
          ];
        })

        # for x11 only
        (lib.optionalAttrs (profile.settings.desktop.displayProtocol == "x11") {
          home.packages = [
            pkgs.xclip  # clipboard
            pkgs.xcolor # color picker
          ];
        })
      ]);
  };
}
