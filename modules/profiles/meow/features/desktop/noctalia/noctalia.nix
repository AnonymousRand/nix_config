{ den, ... }: {
  den.aspects.profiles.meow = {
    homeManager = { syst, config, lib, ... }: {
      xdg.configFile."noctalia" = {
        source = ./dotfiles;
        recursive = true;
      };

      programs.noctalia = {
        settings = {
          # (note that `directory` only seems to be for automation/randomizer;
          # otherwise, set `default.path`)
          wallpaper.directory = "${config.xdg.configHome}/noctalia/wallpapers/";

          # lockscreen
          lockscreen_widgets.widget = lib.mapAttrs' (outputName: _:
            lib.nameValuePair ("lockscreen-login-box@${outputName}") {
              settings = {
                # why are these enabled by default? does anyone actually want these?? >w<
                show_media = false;
                show_weather = false;
              };
            }
          ) syst.settings.capabilities.graphics.displayOutputs;
        };
      };
    };
  };
}
