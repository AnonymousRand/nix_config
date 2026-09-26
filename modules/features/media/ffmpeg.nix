{
  den.aspects.features.media.ffmpeg = {
    homeManager = { systSettings, lib, pkgs, ... }:
      lib.mkIf (systSettings.settings.capabilities.has [ "media" ]) {
        home.packages = [
          pkgs.ffmpeg
        ];
      };
  };
}
