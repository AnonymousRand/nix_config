{
  den.aspects.features.tools.nvtop = { host, lib, ... }: {
    homeManager = { host, lib, pkgs, ... }: lib.optionalAttrs (host.capabilities.has [ "gpu" ]) {
      home.packages = [
        pkgs.nvtopPackages.full
      ];
    };
  };
}
