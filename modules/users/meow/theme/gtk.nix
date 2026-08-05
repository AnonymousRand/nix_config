{ den, ... }: {
  den.aspects.users.meow = {
    includes = [
      den.aspects.theme.gtk
    ];

    homeManager = { config, ... }: {
      # noctalia theming (not using `gtk` aspect's options to accommodate noctalia theming)
      theme.noctalia-theming.templates = {
        #gtk3 = {
        #  input_path = "${config.theme.compile-scss.cssOutput}/base_scss/gtk3/index.css";
        #  output_path = "$XDG_CONFIG_HOME/gtk-3.0/gtk.css";
        #};

        gtk4 = {
          input_path = "${config.theme.compile-scss.cssOutput}/base_scss/gtk4/index.css";
          output_path = "$XDG_CONFIG_HOME/gtk-4.0/gtk.css";
        };
      };
    };
  };
}
