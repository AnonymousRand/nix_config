{ den, ... }: {
  den.aspects.features.tools.brightnessctl = {
    homeManager = { core, lib, pkgs, ... }:
      lib.mkIf (core.capabilities.has [ "brightness" ]) {
        home.packages = [
          pkgs.brightnessctl
        ];
      };
  };
}
