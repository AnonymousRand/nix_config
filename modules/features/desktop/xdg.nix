{
  den.aspects.features.desktop.xdg = {
    homeManager = { syst, lib, pkgs, ... }:
      lib.mkIf (syst.settings.capabilities.has [ "graphics" ]) {
        xdg = {
          enable = true;
          mimeApps.enable = true;
        };

        home.packages = [
          pkgs.xdg-utils
        ];
      };
  };
}
