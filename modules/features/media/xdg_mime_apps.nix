{
  den.aspects.features.media.xdg-mime-apps = { systSettings }: {
    homeManager = { lib, ... }: lib.mkIf (systSettings.capabilities.has [ "media" ]) {
      xdg.mimeApps.enable = true;
    };
  };
}
