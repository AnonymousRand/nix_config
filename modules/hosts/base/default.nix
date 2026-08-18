{ den, ... }: {
  # note: this aspect must be manually imported in each host *aspect*, i haven't found another way
  # (importing in schema means i have to add `provides.to-user` to all the `homeManager` modules)
  den.aspects.hosts.base = {
    # aspects to be included in every host
    includes = [
      # sets `nixos.networking.hostName` from `host.hostName` in host entity
      den.batteries.hostname

      # these are essentially like batteries
      den.aspects.syst-settings.capabilities
      den.aspects.syst-settings.state-version

      # activate these utils
      den.aspects.utils.nix-ld
      den.aspects.utils.overlays

      den.aspects.features.xdg-mime-apps

      den.aspects.features.terminal.bash

      den.aspects.features.editors.vim

      den.aspects.features.tools.brightnessctl
      den.aspects.features.tools.cli-utils
      den.aspects.features.tools.git
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
