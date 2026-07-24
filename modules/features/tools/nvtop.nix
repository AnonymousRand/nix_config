{
  den.aspects.features.tools.nvtop = {
    # TODO this might need nixos
    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.nvtopPackages.full
      ];
    };
  };
}
