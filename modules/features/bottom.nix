{
  den.aspects.bottom = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = [
        pkgs.bottom
      ];
    };
  };
}
