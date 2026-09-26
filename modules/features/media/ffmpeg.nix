{
  den.aspects.features.media.ffmpeg = {
    homeManager = { syst, lib, pkgs, ... }:
      lib.mkIf (syst.settings.capabilities.has [ "media" ]) {
        home.packages = [
          pkgs.ffmpeg
        ];
      };
  };
}
