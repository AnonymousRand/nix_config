{ inputs, ... }: {
  flake-file.inputs = {
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.features.desktop.noctalia = {
    nixos = { host, lib, pkgs, ... }: lib.optionalAttrs (host.capabilities.has [ "graphics" ]) {
      environment.systemPackages = [
        inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
    };

    homeManager = { host, lib, ... }: lib.optionalAttrs (host.capabilities.has [ "graphics" ]) {
      imports = [
        inputs.noctalia.homeModules.default
      ];

      programs.noctalia.enable = true;
    };
  };
}
