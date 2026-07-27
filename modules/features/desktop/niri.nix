{ inputs, ... }: {
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
    nixos = { pkgs, ... }: {
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
    };

    provides.to-users.homeManager = { host, ... }: {
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
          ) host.displayOutputs;
        };
      };
    };
  };
}
