{
  den.aspects.features.tools.desktop-utils = { host, lib, ... }:
    lib.mkIf host.capabilities.graphics.supported {
      homeManager = { pkgs, ... }: {
        home.packages = [
          pkgs.normcap # OCR tool
        ];
      };

      _.wayland = {
        homeManager = { pkgs, ... }: {
          home.packages = [
            pkgs.hyprpicker   # color picker
            pkgs.wl-clipboard # wayland clipboard
          ];
        };
      };
    };
}
