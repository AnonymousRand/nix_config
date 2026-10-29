{ den, ... }: {
  den.aspects.features.media.tesseract = {
    homeManager = { syst, lib, pkgs, ... }:
      lib.mkIf (syst.settings.capabilities.has [ "graphics" "media" ]) {
        home.packages = [
          pkgs.tesseract
        ];
      };
  };
}
