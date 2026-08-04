{
  den.aspects.features.theme.fonts.quicksand = {
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
