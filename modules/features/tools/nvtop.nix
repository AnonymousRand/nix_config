{
  den.aspects.features.tools.nvtop = {
    homeManager = { core, lib, pkgs, ... }:
      lib.optionalAttrs (core.capabilities.has [ "gpu" ]) {
        home.packages = [
          pkgs.nvtopPackages.full
        ];
      };
  };
}
