{ den, ... }: {
  den.aspects.features.terminal.bash = {
    includes = [
      # `readline` is for handling keyboard input (i.e. `.inputrc`)
      den.aspects.features.terminal.readline
    ];

    nixos = {
      programs.bash = {
        enable = true;
        # allow completion
        # (this is needed too if users want to get completion via home manager for system packages)
        completion.enable = true;
      };
    };

    homeManager = {
      programs.bash.enable = true;
    };
  };
}
