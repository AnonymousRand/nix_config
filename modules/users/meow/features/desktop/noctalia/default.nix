{ den, ... }: {
  meow.features.desktop.noctalia = {
    includes = [
      den.aspects.features.desktop.noctalia
    ];

    homeManager = { config, ... }: {
      xdg.configFile."noctalia" = {
        source = ./dotfiles;
        recursive = true;
      };

      programs.noctalia = {
        settings = {
          # (note that `directory` only seems to be for automation/randomizer, else set `default.path`)
          wallpaper.directory = "${config.xdg.configHome}/wallpapers/";
        };
      };
    };
  };
}
