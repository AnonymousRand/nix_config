{
  den.aspects.profiles.meow =
    let
      exportedBasePath = "nix_exports/common";
    in
    {
      # SYNC: output path of generated css from `compile-scss` battery!
      homeManager = { config, ... }: {
        # copy rendered css output needed for external users from nix store to `$XDG_DATA_HOME`
        # for easier access (currently still needs manual copying to the external places though)
        aspects.batteries.noctalia-theming.templates = {
          externColors = {
            input_path =
              "${config.aspects.batteries.compile-scss.cssOutput}/generated/colors.css";
            output_path = "$XDG_DATA_HOME/${exportedBasePath}/css/colors.css";
          };

          # currently not copying over auto theme since it's not needed
          externLightThemeCss = {
            input_path =
              "${config.aspects.batteries.compile-scss.cssOutput}/generated/light_theme.css";
            output_path = "$XDG_DATA_HOME/${exportedBasePath}/css/light_theme.css";
          };

          externDarkThemeCss = {
            input_path =
              "${config.aspects.batteries.compile-scss.cssOutput}/generated/dark_theme.css";
            output_path = "$XDG_DATA_HOME/${exportedBasePath}/css/dark_theme.css";
          };
        };
      };
    };
}
