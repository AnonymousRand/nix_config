{
  den.aspects.features.media.gthumb = {
    homeManager = { syst, lib, pkgs, ... }:
      lib.mkIf (syst.settings.capabilities.has [ "graphics" "media" ]) {
        home.packages = [
          pkgs.gthumb
        ];
      };
  };
}
