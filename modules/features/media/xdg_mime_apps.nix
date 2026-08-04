{
  den.aspects.features.media.xdg-mime-apps = {
    homeManager = { core, lib, ... }:
      lib.mkIf (core.capabilities.has [ "media" ]) {
        xdg.mimeApps.enable = true;
      };
  };
}
