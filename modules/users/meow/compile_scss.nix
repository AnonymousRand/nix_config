{ den, ... }: {
  den.aspects.users.meow = {
    # enable `compile-scss`
    includes = [
      den.aspects.utils.compile-scss
    ];

    den.aspects.utils.compile-scss = {
      pathsToCompile = [ ./features ];
      pathsToLoad = [ ./base_scss ];
    };
  };
}
