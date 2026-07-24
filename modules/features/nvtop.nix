{
  den.aspects.nvtop = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = [
        pkgs.nvtopPackages.full
      ];
    };
  };
}
