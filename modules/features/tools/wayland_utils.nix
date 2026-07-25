{
  den.aspects.features.tools.wayland-utils = {
    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.hyprpicker   # color picker
        pkgs.wl-clipboard # wayland clipboard
      ];
    };
  };
}
