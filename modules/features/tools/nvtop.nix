{
  den.aspects.features.tools.nvtop = { host, lib, ... }: {
    homeManager = { host, pkgs, ... }: import ../_require_capabilities.nix host [ "gpu" ] {
      home.packages = [
        pkgs.nvtopPackages.full
      ];
    };
  };
}
