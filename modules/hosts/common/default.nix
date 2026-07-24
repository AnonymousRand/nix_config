{ den, self, ... }: {
  den.schema.host = { host, lib, ... }: {
    # change default aspect name associated with host entities to fit our naming scheme
    aspect = den.aspects.hosts.${host.name};

    # require a `stateVersion` option in each host entity
    options.stateVersion = lib.mkOption {
      type = lib.types.str;
    };

    # aspects to be included in every host entity
    includes = [
      # sets `nixos.networking.hostName` from `host.hostName` in host entity
      den.batteries.hostname

      den.aspects.features.tools.git
      den.aspects.features.tools.utils

      den.aspects.features.editors.vim

      den.aspects.utils.nix-ld

      {
        nixos = {
          # load custom overlays (e.g. from `perSystem.overlayAttrs`)
          # TODO: this probably won't work. might need to be in specific hosts, might not be able to access `self`
          # if `self` doesn't work, try `inputs.self`. last resort try quirk?
          nixpkgs.overlays = [ self.overlays.default ];

          # this is only executed if this host has home manager in its inputs
          # TODO check
          home-manager = {
            # allows home manager to see `nixpkgs overlays
            useGlobalPkgs = true;
            # installs user packages into `/etc/profile/per-user/<username>/` (i.e.
            # `users.users.<username>.packages`) instead of the default `~/.nix-profile`
            # can be convenient for certain system-level things
            useUserPackages = true;
          };
        };
      }
    ];
  };
}
