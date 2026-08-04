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
        xdg.configFile."${wallpapersCfgPath}" = {
          source = ./dotfiles/wallpapers;
          recursive = true;
        };

        programs.noctalia = {
          # (note: can't move to dotfile as `settings` also set in `den.aspects.utils.noctalia-theming`,
          # and `settings` seems to completely set the entire config file)
          settings = {
            theme = {
              # switch between light and dark themes automatically
              mode = "auto";

              templates = {
                enable_builtin_templates = true;
              };
            };

            wallpaper = rec {
              enabled = true;
              # (note that `directory` only seems to really be for the automation/randomizer)
              directory = "${config.xdg.configHome}/${wallpapersCfgPath}";
              default.path = "${directory}/whitepine.png";
              fill_mode = "fit";
              transition = [ "fade" ];
              transition_on_startup = true;
              transition_duration = 1500;

              automation = {
                enabled = true;
                interval_seconds = 1800;
                order = "random";
                recursive = false;
              };
            };

            location = {
              auto_locate = false;
              custom_schedule = true;
              sunrise = "09:00";
              sunset = "18:00";
            };

            shell = {
              show_location = false;
              polkit_agent = true;
            };
          };
        };
      };
  };
}
