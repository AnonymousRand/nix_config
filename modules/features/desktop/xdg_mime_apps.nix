{
  den.aspects.features.desktop.xdg-mime-apps = {
    homeManager = { lib, syst, ... }:
      lib.mkIf (syst.settings.capabilities.has [ "graphics" ]) {
        xdg.mimeApps.enable = true;
      };
  };
}
