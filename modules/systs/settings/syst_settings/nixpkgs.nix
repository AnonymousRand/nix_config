{
  den.schema.systm = { lib, ... }: {
    options.settings.nixpkgs = {
      allowUnfree = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
    };
  };

  # (putting `host` and `home` in class module args does break with "attribute missing")
  den.aspects.syst-settings.nixpkgs = { syst, host ? null, home ? null }: {
    nixos = { lib, ... }: {
      nixpkgs.config.allowUnfree = syst.settings.nixpkgs.allowUnfree;
    };

    homeManager = { lib, ... }:
      # only set `nixpkgs.config` in home manager class module if `useGlobalPkgs` was `false`
      # or if standalone (i.e. `home` present)! otherwise not allowed
      lib.mkIf (home != null || !host.settings.hmUseGlobalPkgs) {
        nixpkgs.config.allowUnfree = syst.settings.nixpkgs.allowUnfree;
      };
  };
  };
}
