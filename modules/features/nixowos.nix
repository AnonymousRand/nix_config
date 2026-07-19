{ inputs, ... }: {
  flake.nixosModules.nixowos = {
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
