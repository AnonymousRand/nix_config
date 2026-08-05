{ den, ... }: {
  meow.features.fonts.quicksand = {
    includes = [
      den.aspects.features.fonts.quicksand
    ];

    homeManager = { pkgs, ... }: {
      fonts.fontconfig = {
        configFile.quicksand = {
          enable = true;
          label = "quicksand";
          priority = 90;
          source = ./dotfiles/quicksand.conf;
        };
      };
    };
  };
}
