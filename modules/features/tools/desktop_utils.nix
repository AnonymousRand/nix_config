{
  den.aspects.features.tools.desktop-utils = {
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
