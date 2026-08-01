{
  den.aspects.hosts.base = { lib, ... }: {
    nixos = { host, overlays, ... }: {
      nixpkgs.overlays = lib.unique overlays;

      # allows home manager to see `nixpkgs` overlays if this is `true`
      home-manager.useGlobalPkgs = lib.mkForce host.quirks.overlays.hmUseGlobalPkgs;
    };

    homeManager = { host, overlays, ... }:
      # only set `nixpkgs.overlays` in home manager class module if `useGlobalPkgs` was `false`
      # (which includes if home manager is standalone)! otherwise, this is not allowed
      lib.mkIf (!host.quirks.overlays.hmUseGlobalPkgs) {
        nixpkgs.overlays = lib.unique overlays;
      };
  };
}
