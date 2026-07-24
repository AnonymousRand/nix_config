{
  den.aspects.features.tools.brightnessctl = {
    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.brightnessctl
      ];
    };
  };
}
