{
  den.aspects.hosts.base = {
    nixos = {
      # installs user packages into `/etc/profile/per-user/<username>/` (i.e.
      # `users.users.<username>.packages`) instead of the default `~/.nix-profile`
      # which can be convenient for certain system-level things
      home-manager.useUserPackages = true;
    };

    homeManager = {
      # enables standalone `home-manager` command
      programs.home-manager.enable = true;
    };
  };
}
