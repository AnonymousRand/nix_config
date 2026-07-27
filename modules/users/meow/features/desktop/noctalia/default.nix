{ den, ... }: {
  meow.features.desktop.noctalia = {
    includes = [
      den.aspects.features.desktop.noctalia
    ];

    homeManager = {
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

          location = {
            auto_locate = false;
            custom_schedule = true;
            sunrise = "09:00";
            sunset = "18:00";
          };
        };
      };
    };
  };
}
