{
  den.aspects.profiles.meow = {
    # copy rendered css output needed for external uses from nix store to `$XDG_DATA_HOME` for
    # easier access (currently still needs manual copying from there to the external places though)
    homeManager = { config, ... }: {
      aspects.batteries.noctalia-theming.templates = {
        # currently not copying over auto theme since it's not needed
        externLightThemeCss = {
          input_path =
            "${config.aspects.batteries.compile-scss.cssOutput}/base_scss/light_theme.css";
          output_path = "$XDG_DATA_HOME/external_css/light_theme.css";
        };

        externDarkThemeCss = {
          input_path =
            "${config.aspects.batteries.compile-scss.cssOutput}/base_scss/dark_theme.css";
          output_path = "$XDG_DATA_HOME/external_css/dark_theme.css";
        };
      };
    };
  };
}
