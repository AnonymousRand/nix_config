{
  den.aspects.features.tools.nvtop = {
    homeManager = { core, lib, pkgs, ... }:
      lib.mkIf (core.capabilities.has [ "gpu" ]) {
        home.packages = [
          pkgs.nvtopPackages.full
        ];
      };
  };
}
