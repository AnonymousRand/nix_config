{ den, ... }: {
  # note: this aspect must be manually imported in each host *aspect*, i haven't found another way
  # (importing in schema means i have to add `provides.to-user` to all the `homeManager` modules,
  # auto-adding to every non-base aspect in `den.aspects.systs` causes infinite recursion,
  # auto-adding in `den.schema.hosts.aspect.includes` stops tying the base aspect to the host
  # aspects via including/composition and makes the *user* base aspect case weird since then
  # home entities' aspects must also include `den.aspects.users.base`)
  den.aspects.systs.base = {
    # aspects to be included in every host
    includes = [
      # activate the "batteries" associated with these settings
      den.aspects.syst-settings.capabilities
      den.aspects.syst-settings.state-version

      # activate these batteries
      den.aspects.batteries.nix-ld
      den.aspects.batteries.nixpkgs
    ];

    nixos = {
      # installs user packages into `/etc/profile/per-user/<username>/` (i.e.
      # `users.users.<username>.packages`) instead of the default `~/.nix-profile` when
      # home manager is used integrated, which can be convenient for some system-level things?
      # (i think this should be fine even if a host doesn't have home manager?  since it's
      #  in our inputs, and we import its `flakeModules`)
      home-manager.useUserPackages = true;
    };
  };

  den.aspects.hosts.base = {
    includes = [
      den.aspects.systs.base

      # sets `nixos.networking.hostName` from `host.hostName` in host entity
      den.batteries.hostname

      den.aspects.host-settings.admin-users
      den.aspects.host-settings.hm-use-global-pkgs
      den.aspects.host-settings.printing
    ];
  };
}
