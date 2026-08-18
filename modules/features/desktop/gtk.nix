{
  den.aspects.features.desktop.gtk = {
    homeManager = { systSettings, lib, ... }:
      lib.mkIf (systSettings.capabilities.has [ "graphics" ]) {
        gtk = {
          enable = true;
          gtk3.enable = true;
          gtk4.enable = true;
        };
      };
  };
}
