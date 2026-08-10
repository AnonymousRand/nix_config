{ den, ... }: {
  meow.features.theme.fonts.quicksand = {
    includes = [
      den.aspects.features.theme.fonts.quicksand
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
