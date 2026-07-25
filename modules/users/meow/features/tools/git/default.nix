{ den, ... }: {
  meow.features.tools.git = {
    includes = [
      den.aspects.features.tools.git
    ];

    homeManager = {
      programs.git = {
        settings = {
          user.name = "AnonymousRand";
          user.email = "anonymouserand@gmail.com";
          init.defaultBranch = "main";
        };
      };
    };
  };
}
