{
  flake.homeModules.meow = { ... }: {
    programs.git = {
      enable = true;
      settings = {
        user.name = "AnonymousRand";
        user.email = "anonymouserand@gmail.com";
        init.defaultBranch = "main";
      };
    };
  };
}
