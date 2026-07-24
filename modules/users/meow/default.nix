{ den, ... }: {
  den.aspects.meow = {
    # aspects to be included for this user regardless of host
    # (note that as of den v0.3.0, any `nixos` class modules in these includes are automatically
    # forwarded to all hosts this user is defined on; while `homeManager` class modules are
    # evaluated immediately within the context of this user as usual)
    includes = [
      den.batteries.primary-user

      den.aspects.niri
      den.aspects.noctalia
      den.aspects.wayland-utils

      # TODO: check if this imports all subaspects automatically
      den.aspects.fetch
      den.aspects.fish
      den.aspects.ghostty
      den.aspects.git
      den.aspects.kitty
      den.aspects.niri
      den.aspects.nixowos
      den.aspects.noctalia
      den.aspects.ssh
      den.aspects.vim
    ];

    # `user` class is equivalent to `nixos.users.users.<username>`
    user = {
      description = "AnonymousRand";
    };

    homeManager = {
      home.sessionVariables = {
        TERMINAL = "ghostty";
      };

      programs.vim = {
        defaultEditor = true;
      };
    };
  };
}
