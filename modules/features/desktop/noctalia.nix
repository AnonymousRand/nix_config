{ inputs, ... }: {
  flake-file.inputs = {
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.features.desktop.noctalia = {
    # put here so that this is imported regardless of if `systSettings` is in context
    # (otherwise, other aspects wishing to set options defined in these imports must all
    # require `systSettings` arg as well)
    includes = [
      { homeManager.imports = [ inputs.noctalia.homeModules.default ]; }
    ];

    nixos = { systSettings, lib, pkgs, ... }:
      lib.mkIf (systSettings.capabilities.has [ "graphics" ]) {
        environment.systemPackages = [
          inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
        ];
      };

    homeManager = { systSettings, lib, ... }:
      lib.mkIf (systSettings.capabilities.has [ "graphics" ]) {
        programs.noctalia.enable = true;
      };
  };
}
