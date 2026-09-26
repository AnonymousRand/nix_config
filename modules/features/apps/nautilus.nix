{
  den.aspects.features.apps.nautilus = {
    homeManager = { syst, lib, pkgs, ... }:
      lib.mkIf (syst.settings.capabilities.has [ "graphics" ]) {
        home.packages = [
          pkgs.nautilus
        ];
      };
  };
}
