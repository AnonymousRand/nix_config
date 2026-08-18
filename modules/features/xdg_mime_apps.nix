{
  den.aspects.features.xdg-mime-apps = {
    homeManager = { systSettings, lib, ... }:
      lib.mkIf (systSettings.capabilities.has [ "media" ]) {
        xdg.mimeApps.enable = true;
      };
  };
}
