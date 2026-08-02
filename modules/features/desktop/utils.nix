{
  # TODO for some reason using `_.` or `provides.` for this doesn't work (try doing provides chain
  # starting from den.aspects.features?)
  den.aspects.features.desktop.utils.wayland = {
    homeManager = { host, pkgs, ... }: import ../_require_capabilities.nix host [ "graphics" ] {
      home.packages = [
        pkgs.hyprpicker   # color picker
        pkgs.wl-clipboard # wayland clipboard
      ];
    };
  };
}
