{ den, ... }: {
  den.aspects.profiles.meow = {
    includes = [
      den.aspects.features.desktop.noctalia.plugins.bitwarden
    ];

    homeManager = {
      programs.noctalia.settings.plugin_settings."noctalia/bitwarden" = {
        gen_length = 16;
        # unfortunately i can't seem to configure the minimum number of uppercase/etc.
        gen_uppercase = true;
        gen_lowercase = true;
        gen_number = true;
        gen_special = true;
      };
    };
  };
}
