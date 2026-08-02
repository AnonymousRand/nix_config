{ den, inputs, ... }: {
  den.aspects.features.desktop.niri = { host ? null, home ? null }: {
    nixos = { host, pkgs, ... }:
      import ../../_require_capabilities.nix { inherit host home; } [ "graphics" ] {
        programs.niri = {
          enable = true;
        };

        environment.systemPackages = [
          # niri's main way of doing xwayland
          pkgs.xwayland-satellite
        ];
      };

    homeManager = { lib, ... }:
      import ../../_require_capabilities.nix { inherit host home; } [ "graphics" ] {
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
}
