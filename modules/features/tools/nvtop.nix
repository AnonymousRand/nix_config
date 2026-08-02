{
  den.aspects.features.tools.nvtop = {
    homeManager = { syst, lib, pkgs, ... }:
      lib.optionalAttrs (syst.core.capabilities.has [ "gpu" ]) {
        home.packages = [
          pkgs.nvtopPackages.full
        ];
      };
  };
}
