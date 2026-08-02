{
  den.aspects.features.tools.nvtop = { host ? null, home ? null }: {
    homeManager = { pkgs, ... }:
      import ../_require_capabilities.nix { inherit host home; } [ "gpu" ] {
        home.packages = [
          pkgs.nvtopPackages.full
        ];
      };
  };
}
