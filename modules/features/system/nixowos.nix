{ inputs, ... }: {
  flake-file.inputs = {
    nixowos = {
      url = "github:yunfachi/nixowos";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.features.system.nixowos = {
    nixos = {
      imports = [
        inputs.nixowos.nixosModules.default
      ];

      nixowos = {
        enable = true;
        overlays = {
          # as NixOwOS is now supported natively in hyfetch, no longer requiring this patch
          hyfetch = false;
        };
      };
    };

    # TODO: needed?
    homeManager = {
      imports = [
        inputs.nixowos.homeModules.default
      ];

      nixowos = {
        enable = true;
        overlays = {
          hyfetch = false;
        };
      };
    };
  };
}
