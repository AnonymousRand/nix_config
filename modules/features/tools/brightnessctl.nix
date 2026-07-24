{
  den.aspects.tools.brightnessctl = {
    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.brightnessctl
      ];
    };
  };
}
