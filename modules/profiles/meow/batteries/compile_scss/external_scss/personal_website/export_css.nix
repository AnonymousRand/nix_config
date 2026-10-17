{
  den.aspects.profiles.meow = {
    homeManager = { config, ... }: {
      aspects.batteries.noctalia-theming.templates = {
        externPersonalWebsiteBtn = {
          input_path =
            "${config.aspects.batteries.compile-scss.cssOutput}/"
            + "external_scss/personal_website/btn.css";
          output_path = "$XDG_DATA_HOME/external_css/personal_website/btn.css";
        };
      };
    };
  };
}
