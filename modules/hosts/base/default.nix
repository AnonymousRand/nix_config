{ den, ... }: {
  den.aspects.hosts.base = {
    # aspects to be included in every host
    includes = [
      # sets `nixos.networking.hostName` from `host.hostName` in host entity
      den.batteries.hostname

      # activate the "batteries" associated with these settings
      den.aspects.syst-settings.capabilities
      den.aspects.syst-settings.state-version
      den.aspects.host-settings.hm-use-global-pkgs

      # activate these batteries
      den.aspects.batteries.nix-ld
      den.aspects.batteries.overlays
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
}
