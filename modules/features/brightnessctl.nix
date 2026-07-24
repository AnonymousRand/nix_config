{
  den.aspects.brightnessctl = {
    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.brightnessctl
      ];
    };
  };
}
