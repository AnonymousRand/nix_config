{ den, ... }: {
  den.aspects.meow = {
    # aspects to be included for this user regardless of host
    # (note that as of den v0.3.0, any `nixos` class modules in these includes are automatically
    # forwarded to all hosts this user is defined on; while `homeManager` class modules are
    # evaluated immediately within the context of this user as usual)
    includes = [
      den.batteries.primary-user

      den.aspects.system.nixowos.meow

      den.aspects.desktop.niri.meow
      den.aspects.desktop.noctalia.meow

      den.aspects.terminal.fish.meow
      den.aspects.terminal.ghostty.meow
      den.aspects.terminal.kitty.meow

      den.aspects.editors.vim.meow

      den.aspects.tools.fetch.hyfetch.meow
      den.aspects.tools.fetch.fastfetch.meow
      den.aspects.tools.git.meow
      den.aspects.tools.ssh-client.meow
      den.aspects.tools.wayland-utils
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
