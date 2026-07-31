{ den, inputs, ... }:
let
  username = "meow";
in
{
  imports = [
    # create a namespace for this user, which allows us to define "private" aspects
    # under `<username>.<aspect name>`
    # (the `false` means this namespace is only consumed internally, not exposed in flake outputs)
    (inputs.den.namespace username false)
  ];

  den.aspects.users.${username} = {
    provides.to-host = {
      # >TODO this not working?
      # e.g. try config.capabilities?
      capabilities.graphics.displayProtocol = "wayland";
    };

    # aspects to be included for this user regardless of host
    includes = [
      den.aspects.users.base

      den.batteries.primary-user

      # (nix doesn't let us start these with `${username}` so we have to use the full
      # `den.ful` namespace names. grrr 3:<)
      den.ful.${username}.features.desktop.niri
      den.ful.${username}.features.desktop.noctalia
      #den.aspects.features.tools.desktop-utils.wayland
      #den.aspects.features.tools.wayland-utils

      den.ful.${username}.features.fonts.fontconfig
      den.ful.${username}.features.fonts.maple-mono

      den.ful.${username}.features.terminal.bash
      den.ful.${username}.features.terminal.fish
      den.ful.${username}.features.terminal.ghostty
      den.ful.${username}.features.terminal.kitty

      den.ful.${username}.features.editors.vim

      den.ful.${username}.features.tools.bottom
      den.ful.${username}.features.tools.fastfetch
      den.ful.${username}.features.tools.git
      den.ful.${username}.features.tools.hyfetch
      den.ful.${username}.features.tools.ssh-client
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
