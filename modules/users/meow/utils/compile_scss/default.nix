{ den, ... }: {
  den.aspects.users.meow = {
    includes = [
      # enable `compile-scss`
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
