{ den, inputs, ... }: {
  den.aspects.features.desktop.niri = {
    nixos = { systSettings, lib, pkgs, ... }:
      lib.mkIf (systSettings.settings.capabilities.has [ "graphics" ]) {
        programs.niri = {
          enable = true;
        };

        environment.systemPackages = [
          # niri's main way of doing xwayland
          pkgs.xwayland-satellite
        ];
      };

    homeManager = { systSettings, lib, ... }:
      lib.mkIf (systSettings.settings.capabilities.has [ "graphics" ]) {
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
          ) systSettings.settings.capabilities.graphics.displayOutputs;
        };
      };
  };
}
