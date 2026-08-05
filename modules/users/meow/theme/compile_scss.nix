{ den, ... }: {
  den.aspects.users.meow = {
    includes = [
      # enable `compile-scss`
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
