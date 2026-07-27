{ den, meow, inputs, ... }:
{
  imports = [
    # create a namespace for this user, which allows us to define "private" aspects
    # under `<username>.<aspect name>`
    # (the `false` means this namespace is only consumed internally, not exposed in flake outputs)
    (inputs.den.namespace "meow" false)
  ];

  den.aspects.users.meow = {
    # aspects to be included for this user regardless of host
    includes = [
      den.aspects.users.base

      den.batteries.primary-user

      ##########################################################################
      # aspects unchanged from the base config

      den.aspects.features.tools.wayland-utils

      ##########################################################################
      # aspects extending the base config with our own "private" config (using our custom namespace)

      meow.features.desktop.niri
      meow.features.desktop.noctalia

      meow.features.terminal.fish
      meow.features.terminal.ghostty
      meow.features.terminal.kitty

      meow.features.editors.vim

      meow.features.tools.bottom
      meow.features.tools.fastfetch
      meow.features.tools.git
      meow.features.tools.hyfetch
      meow.features.tools.ssh-client
    ];

    # `user` class is forwarded to `nixos.users.users.<username>`
    user = {
      description = "AnonymousRand";
    };

    # `homeManager` class is forwarded to `home-manager.users.<username>` (if integrated)
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
