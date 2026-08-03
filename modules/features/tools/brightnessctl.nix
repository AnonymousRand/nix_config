{ den, ... }: {
  den.aspects.features.tools.brightnessctl = {
    homeManager = { core, lib, pkgs, ... }:
      lib.optionalAttrs (core.capabilities.has [ "brightness" ]) {
        home.packages = [
          pkgs.brightnessctl
        ];
      };
  };
}
