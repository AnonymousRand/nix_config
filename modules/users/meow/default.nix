{ den, inputs, ... }:

let
  username = "meow"
in {
  imports = [
    # create a namespace for this user, which allows us to define "private" aspects
    # under `<username>.<aspect name>`
    # (the `false` means this namespace is only consumed internally, not exposed in flake outputs)
    (inputs.den.namespace username false)
  ];

  den.aspects.users.meow = {
    # aspects to be included for this user regardless of host
    # (note that as of den v0.3.0, any `nixos` class modules in these includes are automatically
    # forwarded to all hosts this user is defined on; while `homeManager` class modules are
    # evaluated immediately within the context of this user as usual)
    includes = [
      den.batteries.primary-user

      # aspects unchanged from the base config
      den.aspects.features.tools.wayland-utils

      # aspects extending the base config with our own "private" config (using our custom namespace)
      meow.features.desktop.niri
      meow.features.desktop.noctalia

      meow.features.terminal.fish
      meow.features.terminal.ghostty
      meow.features.terminal.kitty

      meow.features.editors.vim

      meow.features.tools.fetch.hyfetch
      meow.features.tools.fetch.fastfetch
      meow.features.tools.git
      meow.features.tools.ssh-client
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
