{ den, ... }: {
  meow.features.desktop.noctalia = {
    includes = [
      den.aspects.features.desktop.noctalia
    ];

    homeManager = { config, ... }:
      let
        wallpapersCfgPath = "noctalia/wallpapers";
      in
      {
        # (note: can't user `config.toml` dotfile as `settings` also set in noctalia theming aspect,
        # and `settings` seems to completely set the entire `config.toml` file)
        xdg.configFile."noctalia/config2.toml".source = ./dotfiles/config.toml;

        xdg.configFile."${wallpapersCfgPath}" = {
          source = ./dotfiles/wallpapers;
          recursive = true;
        };

        programs.noctalia = {
          settings = {
            # (note that `directory` only seems to be for automation/randomizer, else set `default.path`)
            wallpaper.directory = "${config.xdg.configHome}/${wallpapersCfgPath}";
          };
        };
      };
  };
}
