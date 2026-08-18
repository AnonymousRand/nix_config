{
  den.schema.host = { lib, ... }: {
    options.hostSettings = {
      hmUseGlobalPkgs = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
    };
  };

  den.aspects.host-settings.hm-use-global-pkgs = {
    nixos = { hostSettings, lib, ... }: {
      # allows home manager to see `nixpkgs` overlays etc. if this is `true`
      home-manager.useGlobalPkgs = lib.mkForce hostSettings.hmUseGlobalPkgs;
    };
  };
}
