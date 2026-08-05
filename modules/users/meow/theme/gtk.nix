{ den, ... }: {
  den.aspects.users.meow = {
    includes = [
      den.aspects.theme.gtk
    ];

    homeManager = { config, ... }: {
      theme.gtk.gtk4Css = builtins.readFile
        "${config.theme.compile-scss.cssOutput}/base_scss/gtk/index.css";
    };
  };
}
