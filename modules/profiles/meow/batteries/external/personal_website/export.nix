{
  den.aspects.profiles.meow =
    let
      exportedBasePath = "nix_exports/personal_website";
    in
    {
      quirks-compile-scss-paths-to-compile = [ ./scss_to_compile/personal_website ];

      homeManager = { config, ... }: {
        xdg.dataFile."${exportedBasePath}/css/btn.css".source =
          config.aspects.batteries.compile-scss.cssOutput + "/personal_website/btn.css";
      };
    };
}
