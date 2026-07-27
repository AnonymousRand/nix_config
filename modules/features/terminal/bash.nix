{
  den.aspects.features.terminal.bash = {
    nixos = {
      programs.bash.enable = true;
    };

    provides.to-users.homeManager = {
      programs.bash.enable = true;
    };
  };
}
