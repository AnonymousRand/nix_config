{ den, ... }: {
  den.aspects.systs.base = {
    includes = [
      # activate the "batteries" associated with these settings
      den.aspects.syst-settings.capabilities
      den.aspects.syst-settings.state-version

      # activate these batteries
      den.aspects.batteries.nix-ld
      den.aspects.batteries.nixpkgs
    ];

    nixos = {
      # enable nix flakes
      nix.settings.experimental-features = [ "nix-command" "flakes" ];

      # installs user packages into `/etc/profile/per-user/<username>/` (i.e.
      # `users.users.<username>.packages`) instead of the default `~/.nix-profile` when
      # home manager is used integrated, which can be convenient for some system-level things?
      # (i think this should be fine even if a host doesn't have home manager?  since it's
      #  in our inputs, and we import its `flakeModules`)
      home-manager.useUserPackages = true;
    };

    homeManager = {
      nix.settings.experimental-features = [ "nix-command" "flakes" ];
    };
  };
}
