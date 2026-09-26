{
  den.aspects.features.tools.nvtop = {
    homeManager = { syst, lib, pkgs, ... }:
      lib.mkIf (syst.settings.capabilities.has [ "gpu" ]) {
        home.packages = [
          pkgs.nvtopPackages.full
        ];
      };
  };
}
