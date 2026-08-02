{ den, inputs, ... }: {
  den.aspects.features.desktop.niri = {
    nixos = { host, pkgs, ... }: import ../../_require_capabilities.nix host [ "graphics" ] {
      programs.niri = {
        enable = true;
      };

      environment.systemPackages = [
        # niri's main way of doing xwayland
        pkgs.xwayland-satellite
      ];
    };

    homeManager = { host, lib, ... }: import ../../_require_capabilities.nix host [ "graphics" ] {
      wayland.windowManager.niri = {
        enable = true;

        # dynamically generate display output settings based on `host.displayOutputs` custom option
        settings = lib.mapAttrs' (name: value:
          lib.nameValuePair ("output \"${name}\"") {
            mode = "${builtins.toString value.resolution.width}" +
                   "x${builtins.toString value.resolution.height}" +
                   "@${builtins.toString value.refreshRate}";
            scale = value.scale;
            position._props = {
              x = value.position.x;
              y = value.position.y;
            };
          }
        ) host.capabilities.graphics.displayOutputs;
      };
    };
  };

  den.aspects.features.desktop.niri.screenshots = {
    includes = [
      # (scripts require bash, inotifywait, and flock)
      den.aspects.features.terminal.bash
      den.aspects.features.tools.cli-utils
    ];

    homeManager = { host, pkgs, ... }: import ../../_require_capabilities.nix host [ "graphics" ] {
      home.packages = [
        pkgs.tesseract # OCR
      ];

      programs.satty.enable = true; # annotated screenshots

      # copy over scripts for annotated screenshots/OCR (bind these to hotkeys in configs!)
      xdg.configFile."niri/scripts/annotated_screenshot.sh".source = ./dotfiles/scripts/annotated_screenshot.sh;
      xdg.configFile."niri/scripts/ocr.sh".source = ./dotfiles/scripts/ocr.sh;
    };
  };
}
