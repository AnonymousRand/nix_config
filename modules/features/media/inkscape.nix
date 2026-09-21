{
  den.aspects.features.media.inkscape = {
    homeManager = { systSettings, lib, pkgs, ... }:
      lib.mkIf (systSettings.capabilities.has [ "graphics" "media" ]) {
        home.packages = [
          pkgs.inkscape
        ];
      };
  };
}
