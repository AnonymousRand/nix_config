{
  flake.homeModules.meow = {
    programs.git = {
      settings = {
        user.name = "AnonymousRand";
        user.email = "anonymouserand@gmail.com";
        init.defaultBranch = "main";
      };
    };
  };
}
