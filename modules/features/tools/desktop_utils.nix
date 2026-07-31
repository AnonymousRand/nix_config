{
  den.aspects.features.tools.desktop-utils = {
    homeManager = { host, pkgs, ... }: import ../_require_capabilities.nix host [ "graphics" ] {
      home.packages = [
        # TODO haven't yet tested if this ocr tool is good!
        pkgs.normcap # OCR tool
      ];
    };
  };

  # >TODO for some reason using `_.` or `provides.` for this doesn't work (try doing provides chain
  # starting from den.aspects.features?)
  den.aspects.features.tools.desktop-utils.wayland = {
    homeManager = { host, pkgs, ... }: import ../_require_capabilities.nix host [ "graphics" ] {
      home.packages = [
        pkgs.hyprpicker   # color picker
        pkgs.wl-clipboard # wayland clipboard
      ];
    };
  };
}
