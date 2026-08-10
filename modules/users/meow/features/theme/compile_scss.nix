{ den, meow, ... }: {
  meow.features.theme.compile-scss = {
    includes = [
      den.aspects.features.theme.compile-scss
    ];

    homeManager = {
      features.theme.compile-scss = {
        pathsToCompile = [ ../. ./base_scss ];
        pathsToLoad = [ ./base_scss ];
      };
    };
  };
}
