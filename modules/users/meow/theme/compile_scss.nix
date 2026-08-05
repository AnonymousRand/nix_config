{ den, meow, ... }: {
  meow.theme.compile-scss = {
    includes = [
      den.aspects.theme.compile-scss
    ];

    homeManager = {
      theme.compile-scss = {
        pathsToCompile = [ ../features ./base_scss ];
        pathsToLoad = [ ./base_scss ];
      };
    };
  };
}
