{ den, inputs, ... }: {
  flake-file.inputs = {
    # Niri has a built-in flake as a NixOS option but it doesn't have Home Manager options
    niri = {
      # sodiboo's flake is the common alternative but it's being slow with updates
      # epireyn's is more updated but also barely maintained
      # bananad3v's is *also* barely maintained but it has `extraConfig`
      #url = "github:epireyn/niri-flake";
      url = "git+https://codeberg.org/BANanaD3V/niri-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.features.desktop.niri = {
    includes = [
      den.aspects.features.desktop.portals
    ];

    nixos = { host, pkgs, ... }: import ../../_require_capabilities.nix host [ "graphics" ] {
      imports = [
        inputs.niri.nixosModules.default
      ];

      programs.niri = {
        enable = true;
      };

      environment.systemPackages = [
        # niri's main way of doing xwayland
        pkgs.xwayland-satellite
      ];

      xdg.portal = {
        config = {
          niri = {
            "default" = [ "gnome" "gtk" ];
            "org.freedesktop.impl.portal.Access" = [ "gtk" ];
            "org.freedesktop.impl.portal.Notification" = [ "gtk" ];
            "org.freedesktop.impl.portal.Screenshot" = [ "gtk" ];
            "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
          };
        };

        extraPortals = [
          pkgs.xdg-desktop-portal-gnome
          pkgs.xdg-desktop-portal-gtk
        ];
      };
    };

    homeManager = { host, ... }: import ../../_require_capabilities.nix host [ "graphics" ] {
      imports = [
        inputs.niri.homeModules.default
      ];

      wayland.windowManager.niri = {
        enable = true;
        settings = {
          # dynamically generate display output settings based on `host.displayOutputs` custom option
          output = builtins.map (entry:
            {
              _args = [ entry.name ];
              mode = "${builtins.toString entry.resolution.width}" +
                     "x${builtins.toString entry.resolution.height}" +
                     "@${builtins.toString entry.refreshRate}";
              scale = entry.scale;
              position._props = {
                x = entry.position.x;
                y = entry.position.y;
              };
            }
          ) host.capabilities.graphics.displayOutputs;
        };
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
