{
  den.aspects.features.tools.desktop-utils = {
    meta.requiredCapabilities = [ "graphics" ];

    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.normcap # OCR tool
      ];
    };
  };

  den.aspects.features.tools.desktop-utils.wayland = {
    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.hyprpicker   # color picker
        pkgs.wl-clipboard # wayland clipboard
      ];
    };
  };

  #den.aspects.features.tools.wayland-utils = { host, lib, ... }:
  #lib.mkIf host.capabilities.graphics.supported {
  #  homeManager = { pkgs, ... }: {
  #    home.packages = [
  #      pkgs.hyprpicker   # color picker
  #      pkgs.wl-clipboard # wayland clipboard
  #    ];
  #  };
  #};
}
