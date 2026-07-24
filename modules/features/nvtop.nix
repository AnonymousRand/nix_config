{
  den.aspects.nvtop = {
    # TODO this might need nixos
    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.nvtopPackages.full
      ];
    };
  };
}
