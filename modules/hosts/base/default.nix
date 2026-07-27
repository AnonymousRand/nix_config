{ den, self, ... }: {
  # note: this aspect must be manually imported in each host *aspect*, i haven't found another way
  den.aspects.hosts.base = {
    # aspects to be included in every host
    includes = [
      # sets `nixos.networking.hostName` from `host.hostName` in host entity
      den.batteries.hostname

      den.aspects.features.tools.git
      den.aspects.features.tools.utils

      den.aspects.features.editors.vim
    ];

    nixos = {
      # load custom overlays (e.g. from `perSystem.overlayAttrs`)
      nixpkgs.overlays = [ self.overlays.default ];

      home-manager = {
        # allows home manager to see `nixpkgs overlays
        useGlobalPkgs = true;
        # installs user packages into `/etc/profile/per-user/<username>/` (i.e.
        # `users.users.<username>.packages`) instead of the default `~/.nix-profile`
        # which can be convenient for certain system-level things
        useUserPackages = true;
      };
    };
  };
}
