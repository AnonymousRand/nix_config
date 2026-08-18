{
  den.aspects.features.theme.fonts.quicksand = {
    # TODO try again moving pkgs to aspect-level and using a let bind?
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
