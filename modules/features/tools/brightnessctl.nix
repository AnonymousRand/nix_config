{ den, ... }: {
  den.aspects.features.tools.brightnessctl = {
    homeManager = { syst, lib, pkgs, ... }:
      lib.optionalAttrs (syst.core.capabilities.has [ "brightness" ]) {
        home.packages = [
          pkgs.brightnessctl
        ];
      };
  };
}
