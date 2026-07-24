{
  den.aspects.tokei = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = [
        pkgs.tokei
      ];
    };
  };
}
