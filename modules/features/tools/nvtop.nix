{
  den.aspects.features.tools.nvtop = { host, lib, ... }:
    lib.mkIf host.capabilities.gpu.supported {
      homeManager = { pkgs, ... }: {
        home.packages = [
          pkgs.nvtopPackages.full
        ];
      };
    };
}
