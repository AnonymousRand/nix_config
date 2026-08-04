{ den, ... }: {
  # note: this aspect must be manually imported in each host *aspect*, i haven't found another way
  # (importing in schema means i have to add `provides.to-user` to all the `homeManager` modules)
  den.aspects.hosts.base = {
    # aspects to be included in every host
    includes = [
      # sets `nixos.networking.hostName` from `host.hostName` in host entity
      den.batteries.hostname

      den.aspects.core.capabilities
      den.aspects.core.quirks.nix-ld
      den.aspects.core.quirks.overlays
      den.aspects.core.state-version

      den.aspects.features.fonts.fontconfig

      den.aspects.features.terminal.bash

      den.aspects.features.editors.vim

      den.aspects.features.tools.brightnessctl
      den.aspects.features.tools.cli-utils
      den.aspects.features.tools.git

      den.aspects.features.media.xdg-mime-apps
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
