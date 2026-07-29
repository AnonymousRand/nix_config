{
  den.aspects.features.terminal.readline = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = [
        pkgs.readline
      ];
    };

    homeManager = {
      programs.readline.enable = true;
    };
  };
}
