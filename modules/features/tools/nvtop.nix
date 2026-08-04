{
  den.aspects.features.tools.nvtop = { systSettings }: {
    homeManager = { lib, pkgs, ... }: lib.mkIf (systSettings.capabilities.has [ "gpu" ]) {
      home.packages = [
        pkgs.nvtopPackages.full
      ];
    };
  };
}
