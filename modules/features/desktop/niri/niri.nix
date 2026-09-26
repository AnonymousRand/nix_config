{ den, inputs, ... }: {
  den.aspects.features.desktop.niri = {
    nixos = { syst, lib, pkgs, ... }:
      lib.mkIf (syst.settings.capabilities.has [ "graphics" ]) {
        programs.niri = {
          enable = true;
        };

        environment.systemPackages = [
          # niri's main way of doing xwayland
          pkgs.xwayland-satellite
        ];
      };

    homeManager = { syst, lib, ... }:
      lib.mkIf (syst.settings.capabilities.has [ "graphics" ]) {
        wayland.windowManager.niri = {
          enable = true;

          # dynamically generate display output settings based on `displayOutputs` syst setting
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
          ) syst.settings.capabilities.graphics.displayOutputs;
        };
      };
  };
}
