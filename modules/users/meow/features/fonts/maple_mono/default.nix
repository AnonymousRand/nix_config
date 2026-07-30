{ den, ... }: {
  meow.features.fonts.maple-mono = {
    includes = [
      den.aspects.features.fonts.maple-mono
    ];

    homeManager = { pkgs, ... }: {
      fonts.fontconfig = {
        configFile.mapleMono = {
          enable = true;
          label = "maple-mono";
          priority = 90;
          source = ./dotfiles/maple_mono.conf;
        };
      };
    };
  };
}
