{ den, ... }: {
  meow.features.desktop.noctalia = {
    includes = [
      den.aspects.features.desktop.noctalia
    ];

    homeManager = {
      programs.noctalia = {
        # TODO can move this to dotfile now that dynamic parts have been taken out?
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
