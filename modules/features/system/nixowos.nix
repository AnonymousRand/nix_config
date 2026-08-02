{ inputs, ... }: {
  flake-file.inputs = {
    nixowos = {
      url = "github:yunfachi/nixowos";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.features.system.nixowos = {
    # put here so that this is imported regardless of if `syst` is in context (otherwise, other
    # aspects wishing to set options defined in these imports must all require `syst` arg as well)
    includes = [
      {
        nixos.imports = [ inputs.nixowos.nixosModules.default ];
      }
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
