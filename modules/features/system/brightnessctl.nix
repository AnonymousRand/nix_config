{
  den.aspects.system.brightnessctl = {
    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.brightnessctl
      ];
    };
  };
}
