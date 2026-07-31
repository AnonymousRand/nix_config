{
  den.aspects.features.tools.desktop-utils = {
    homeManager = { host, lib, pkgs, ... }: import ../_requires_capabilities.nix host [ "graphics" ] {
      home.packages = [
        pkgs.normcap # OCR tool
      ] ++ lib.optional (host.capabilities.graphics.displayProtocol == "wayland") [
        pkgs.hyprpicker   # color picker
        pkgs.wl-clipboard # wayland clipboard
      ];
    };
  };

  #den.aspects.features.tools.desktop-utils.wayland = {
  #  meta.requiredCapabilities = [ "graphics" ];

  #  homeManager = { pkgs, ... }: {
  #    home.packages = [
  #      pkgs.hyprpicker   # color picker
  #      pkgs.wl-clipboard # wayland clipboard
  #    ];
  #  };
  #};

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
