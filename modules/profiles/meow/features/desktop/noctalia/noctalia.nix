{ den, ... }: {
  den.aspects.profiles.meow = {
    # plugins
    includes = [
      den.aspects.features.desktop.noctalia.plugins.bongocat
    ];

    homeManager = { config, ... }: {
      xdg.configFile."noctalia" = {
        source = ./dotfiles;
        recursive = true;
      };

      programs.noctalia = {
        settings = {
          # (note that `directory` only seems to be for automation/randomizer;
          # otherwise, set `default.path`)
          wallpaper.directory = "${config.xdg.configHome}/noctalia/wallpapers/";
        };
      };
    };
  };
}
