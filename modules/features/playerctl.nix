{
  den.aspects.playerctl = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = [
        pkgs.playerctl
      ];
    };
  };
}
