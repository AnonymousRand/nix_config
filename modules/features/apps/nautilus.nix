{
  den.aspects.features.apps.nautilus = {
    homeManager = { systSettings, lib, pkgs, ... }:
      lib.mkIf (systSettings.settings.capabilities.has [ "graphics" ]) {
        home.packages = [
          pkgs.nautilus
        ];
      };
  };
}
