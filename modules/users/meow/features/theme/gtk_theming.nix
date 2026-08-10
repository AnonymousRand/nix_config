{ den, meow, ... }: {
  meow.features.theme.gtk-theming = {
    includes = [
      den.aspects.features.theme.gtk-theming
    ];

    homeManager = { config, ... }: {
      # noctalia theming (not using `gtk-theming` aspect's options to accommodate noctalia theming)
      features.theme.noctalia-theming.templates = {
        #gtk3 = {
        #  input_path = "${config.features.theme.compile-scss.cssOutput}/base_scss/gtk3/index.css";
        #  output_path = "$XDG_CONFIG_HOME/gtk-3.0/gtk.css";
        #};

        gtk4 = {
          input_path = "${config.features.theme.compile-scss.cssOutput}/base_scss/gtk4/index.css";
          output_path = "$XDG_CONFIG_HOME/gtk-4.0/gtk.css";
        };
      };
    };
  };
}
