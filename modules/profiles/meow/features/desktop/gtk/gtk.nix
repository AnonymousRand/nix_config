{
  den.aspects.profiles.meow = {
    quirks-compile-scss-paths-to-compile = [ ./scss/gtk ];
    # allow this to be "base scss" that is loaded for other apps to use; without the `gtk/`
    # directory so that `@use`s still have to do `gtk/...`
    quirks-compile-scss-paths-to-load = [ ./scss ];

    homeManager = { config, ... }: {
      # noctalia theming (not using `gtk-theming` aspect's options to accommodate noctalia theming)
      aspects.batteries.noctalia-theming.templates = {
        #gtk3 = {
        #  input_path = "${config.aspects.batteries.compile-scss.cssOutput}/gtk/gtk3/index.css";
        #  output_path = "$XDG_CONFIG_HOME/gtk-3.0/gtk.css";
        #};

        gtk4 = {
          input_path = "${config.aspects.batteries.compile-scss.cssOutput}/gtk/gtk4/index.css";
          output_path = "$XDG_CONFIG_HOME/gtk-4.0/gtk.css";
        };
      };
    };
  };
}
