{
  den.aspects.features.fonts.quicksand = {
    nixos = { pkgs, ... }: {
      fonts.packages = [
        pkgs.quicksand
      ];
    };

    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.quicksand
      ];
    };
  };
}
