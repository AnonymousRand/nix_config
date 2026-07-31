{
  den.aspects.features.tools.brightnessctl = { config, lib, ... }: {
    homeManager = { host, pkgs, ... }: import ../_requires_capabilities.nix host [ "brightness" ] {
      home.packages = [
        pkgs.brightnessctl
      ];
    };
  };
}
