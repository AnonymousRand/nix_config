{
  den.aspects.users.meow = {
    homeManager = {
      programs.readline = {
        extraConfig = builtins.readFile ./dotfiles/inputrc;
      };
    };
  };
}
