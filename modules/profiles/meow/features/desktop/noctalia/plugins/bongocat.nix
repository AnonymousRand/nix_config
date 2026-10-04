{ den, ... }: {
  den.aspects.profiles.meow = {
    includes = [
      den.aspects.features.desktop.noctalia.plugins.bongocat
    ];
  };
}
