{ inputs, ... }: {
  flake-file.inputs = {
    nixowos = {
      url = "github:yunfachi/nixowos";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.features.system.nixowos = {
    includes = [
      { nixos.imports = [ inputs.nixowos.nixosModules.default ]; }
    ];

    nixos = {
      nixowos = {
        enable = true;
        overlays = {
          # as NixOwOS is now supported natively in hyfetch, no longer requiring this patch
          hyfetch = false;
        };
      };
    };
  };
}
