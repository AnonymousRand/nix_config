{ den, ... }:
let
  username = "meow";
in
{
  den.aspects.users.${username} = {
    # aspects to be included for this user regardless of host
    includes = [
      den.aspects.users.base

      den.batteries.primary-user

      # activate these batteries
      den.aspects.batteries.theme.compile-scss
      den.aspects.batteries.theme.gtk-theming
      den.aspects.batteries.theme.noctalia-theming

      den.aspects.features.home-manager-standalone

      den.aspects.features.desktop.fcitx5
      den.aspects.features.desktop.niri
      den.aspects.features.desktop.noctalia
      den.aspects.features.desktop.niri.screenshots
      den.aspects.features.desktop.xdg-mime-apps

      den.aspects.features.fonts.maple-mono
      den.aspects.features.fonts.quicksand

      den.aspects.features.terminal.bash
      den.aspects.features.terminal.fish
      den.aspects.features.terminal.ghostty
      den.aspects.features.terminal.kitty

      den.aspects.features.tools.gpg

      den.aspects.features.editors.vim

      den.aspects.features.tools.bottom
      den.aspects.features.tools.fastfetch
      den.aspects.features.tools.git
      den.aspects.features.tools.hyfetch
      den.aspects.features.tools.nvtop
      den.aspects.features.tools.playerctl
      den.aspects.features.tools.ssh-client
      den.aspects.features.tools.tokei

      den.aspects.features.apps.firefox
      den.aspects.features.apps.nautilus

      den.aspects.features.media.ffmpeg
      den.aspects.features.media.inkscape
      den.aspects.features.media.swayimg
    ];

    # `user` class is forwarded to `nixos.users.users.<username>` by den
    user = {
      description = "AnonymousRand";
    };

    # `homeManager` class is forwarded to `home-manager.users.<username>` by den (if integrated)
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
