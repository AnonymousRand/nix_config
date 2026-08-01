{ den, ... }: {
  den.aspects.features.tools.brightnessctl = {
    homeManager = { host, pkgs, ... }: import ../_require_capabilities.nix host [ "brightness" ] {
      home.packages = [
        pkgs.brightnessctl
      ];
    };
  };
}
