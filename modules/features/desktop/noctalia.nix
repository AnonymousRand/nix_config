{ inputs, ... }: {
  flake-file.inputs = {
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.features.desktop.noctalia = {
    nixos = { host, pkgs, ... }: import ../_require_capabilities.nix host [ "graphics" ] {
      environment.systemPackages = [
        inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
    };

    homeManager = { host, ... }: import ../_require_capabilities.nix host [ "graphics" ] {
      imports = [
        inputs.noctalia.homeModules.default
      ];

      programs.noctalia.enable = true;
    };
  };
}
