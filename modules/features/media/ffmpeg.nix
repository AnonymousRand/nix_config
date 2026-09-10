{
  den.aspects.features.media.ffmpeg = {
    homeManager = { systSettings, lib, pkgs, ... }:
      lib.mkIf (systSettings.capabilities.has [ "media" ]) {
        home.packages = [
          pkgs.ffmpeg
        ];
      };
  };
}
