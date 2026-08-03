{ den, ... }: {
  den.aspects.users.meow = {
    # enable `compile-scss`
    includes = [
      den.aspects.utils.compile-scss
    ];

    homeManager = {
      utils.compile-scss = {
        pathsToCompile = [ ../../features ];
        pathsToLoad = [ ./. ];
      };
    };
  };
}
