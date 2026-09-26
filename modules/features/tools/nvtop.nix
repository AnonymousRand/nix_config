{
  den.aspects.features.tools.nvtop = {
    homeManager = { systSettings, lib, pkgs, ... }:
      lib.mkIf (systSettings.settings.capabilities.has [ "gpu" ]) {
        home.packages = [
          pkgs.nvtopPackages.full
        ];
      };
  };
}
