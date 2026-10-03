{
  den.aspects.profiles.meow = {
    homeManager = {
      programs.readline = {
        extraConfig = builtins.readFile ./dotfiles/inputrc;
      };
    };
  };
}
