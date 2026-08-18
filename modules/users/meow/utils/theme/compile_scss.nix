{ den, meow, ... }: {
  meow.utils.theme.compile-scss = {
    includes = [
      den.aspects.utils.theme.compile-scss
    ];

    homeManager = {
      utils.theme.compile-scss = {
        pathsToCompile = [ ../. ./base_scss ];
        pathsToLoad = [ ./base_scss ];
      };
    };
  };
}
