{
  den.aspects.features.media.loupe = {
    homeManager = { syst, lib, pkgs, ... }:
      lib.mkIf (syst.settings.capabilities.has [ "graphics" "media" ]) {
        home.packages = [
          pkgs.loupe
        ];
      };
  };
}
