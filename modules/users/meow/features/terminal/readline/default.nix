{ den, ... }: {
  meow.features.terminal.readline = {
    includes = [
      den.aspects.features.terminal.readline
    ];

    homeManager = {
      programs.readline = {
        extraConfig = builtins.readFile ./dotfiles/inputrc;
      };
    };
  };
}
