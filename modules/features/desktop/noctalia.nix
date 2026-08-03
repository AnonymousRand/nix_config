{ inputs, ... }: {
  flake-file.inputs = {
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.features.desktop.noctalia = {
    # put here so that this is imported regardless of if `core` is in context (otherwise, other
    # aspects wishing to set options defined in these imports must all require `core` arg as well)
    includes = [
      { homeManager.imports = [ inputs.noctalia.homeModules.default ]; }
    ];

    nixos = { core, lib, pkgs, ... }:
      lib.mkIf (core.capabilities.has [ "graphics" ]) {
        environment.systemPackages = [
          inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
        ];
      };

    homeManager = { core, lib, ... }:
      lib.mkIf (core.capabilities.has [ "graphics" ]) {
        programs.noctalia.enable = true;
      };
  };
}
