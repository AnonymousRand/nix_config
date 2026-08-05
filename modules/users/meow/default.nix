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
    # aspects to be included for this user regardless of host
    includes = [
      den.aspects.users.base

      den.batteries.primary-user

      den.aspects.theme.gtk

      den.aspects.features.home-manager-standalone

      # (nix doesn't let us start these with `${username}` so we have to use the full
      # `den.ful` namespace names. grrr 3:<)
      den.ful.${username}.features.desktop.niri
      den.ful.${username}.features.desktop.noctalia
      den.aspects.features.desktop.niri.screenshots
      den.aspects.features.desktop.utils.wayland

      den.ful.${username}.features.fonts.maple-mono
      den.aspects.features.fonts.quicksand
      #den.ful.${username}.features.fonts.quicksand

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

      den.aspects.features.media.swayimg
      den.ful.${username}.features.media.xdg-mime-apps
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
