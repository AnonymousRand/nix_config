{ den, inputs, ... }:
let
  username = "meow";
  meow = den.ful.${username};
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

      # activate these utils
      den.aspects.utils.theme.compile-scss
      den.aspects.utils.theme.gtk-theming
      den.aspects.utils.theme.noctalia-theming

      den.aspects.features.home-manager-standalone
      meow.features.xdg-mime-apps

      meow.features.desktop.niri
      meow.features.desktop.noctalia
      den.aspects.features.desktop.niri.screenshots
      den.aspects.features.desktop.utils.wayland

      den.aspects.features.fonts.maple-mono
      den.aspects.features.fonts.quicksand

      meow.features.terminal.bash
      meow.features.terminal.fish
      meow.features.terminal.ghostty
      meow.features.terminal.kitty

      meow.features.editors.vim

      meow.features.tools.bottom
      meow.features.tools.fastfetch
      meow.features.tools.git
      meow.features.tools.hyfetch
      meow.features.tools.ssh-client

      den.aspects.features.media.swayimg
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
