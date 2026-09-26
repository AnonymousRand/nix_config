{
  den.aspects.features.desktop.gtk = {
    homeManager = { syst, lib, ... }:
      lib.mkIf (syst.settings.capabilities.has [ "graphics" ]) {
        gtk = {
          enable = true;
          gtk3.enable = true;
          gtk4.enable = true;
        };
      };
  };
}
