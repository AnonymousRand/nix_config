{ inputs, ... }: {
  flake-file.inputs = {
    nixowos = {
      url = "github:yunfachi/nixowos";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  flake.modules.nixos.nixowos = {
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
}
