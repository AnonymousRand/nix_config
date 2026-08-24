{
  den.aspects.users.meow = {
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
