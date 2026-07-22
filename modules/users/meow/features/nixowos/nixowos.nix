{ inputs, ... }: {
  flake.modules.homeManager.meow.nixowos = {
    imports = [
      inputs.nixowos.homeModules.default
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
