{ den, ... }: {
  den.aspects.users.meow = {
    # enable `compile-scss`
    includes = [
      den.aspects.utils.compile-scss
    ];

    homeManager = {
      my.compile-scss = {
        pathsToCompile = [ ../features ];
        pathsToLoad = [ ../base_scss ];
      };
    };
  };
}
