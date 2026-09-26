{
  den.aspects.features.media.inkscape = {
    homeManager = { syst, lib, pkgs, ... }:
      lib.mkIf (syst.settings.capabilities.has [ "graphics" "media" ]) {
        home.packages = [
          pkgs.inkscape
        ];
      };
  };
}
