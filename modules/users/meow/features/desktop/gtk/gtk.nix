{
  den.aspects.users.meow = {
    quirks-compile-scss-paths-to-compile = [ ./scss ];

    homeManager = { config, ... }: {
      # noctalia theming (not using `gtk-theming` aspect's options to accommodate noctalia theming)
      batteries.noctalia-theming.templates = {
        #gtk3 = {
        #  input_path =
        #    "${config.aspects.batteries.compile-scss.cssOutput}/base_scss/gtk3/index.css";
        #  output_path = "$XDG_CONFIG_HOME/gtk-3.0/gtk.css";
        #};

        gtk4 = {
          input_path =
            "${config.aspects.batteries.compile-scss.cssOutput}/base_scss/gtk4/index.css";
          output_path = "$XDG_CONFIG_HOME/gtk-4.0/gtk.css";
        };
      };
    };
  };
}
