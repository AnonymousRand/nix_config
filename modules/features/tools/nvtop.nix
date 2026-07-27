{
  den.aspects.features.tools.nvtop = {
    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.nvtopPackages.full
      ];
    };
  };
}
