{ inputs, ... }: {
  flake-file.inputs = {
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.features.desktop.noctalia = {
    includes = [
      # put here so that this is imported regardless of if `syst` is in context (otherwise, other
      # aspects wishing to set options defined in these imports must all require `syst` arg as well)
      { homeManager.imports = [ inputs.noctalia.homeModules.default ]; }
    ];

    nixos = { syst, lib, pkgs, ... }:
      lib.mkIf (syst.settings.capabilities.has [ "graphics" ]) {
        environment.systemPackages = [
          inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
        ];
      };

    homeManager = { syst, lib, ... }:
      lib.mkIf (syst.settings.capabilities.has [ "graphics" ]) {
        programs.noctalia.enable = true;
      };
  };
}
