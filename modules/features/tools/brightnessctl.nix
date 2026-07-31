{
  den.aspects.features.tools.brightnessctl = {
    meta.requiredCapabilities = [ "brightness" ];

    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.brightnessctl
      ];
    };
  };
}
