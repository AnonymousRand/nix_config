{
  den.aspects.features.desktop.xdg-mime-apps = {
    homeManager = { lib, systSettings, ... }:
      lib.mkIf (systSettings.capabilities.has [ "graphics" ]) {
        xdg.mimeApps.enable = true;
      };
  };
}
