{ den, ... }: {
  den.aspects.features.tools.brightnessctl = {
    homeManager = { host, lib, pkgs, ... }: lib.optionalAttrs (host.capabilities.has [ "brightness" ]) {
      home.packages = [
        pkgs.brightnessctl
      ];
    };
  };
}
