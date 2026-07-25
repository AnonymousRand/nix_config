{ den, inputs, ... }:
let
  username = "meow";
in
{
  imports = [
    # TODO can't do this in schema? ask about it/try to brute force? ok if it's a bit ugly i think
    # oh try { config, ... }: { imports = [] } in top-level of schema? like aspect custom submodules
    # create a namespace for this user, which allows us to define "private" aspects
    # under `<username>.<aspect name>`
    # (the `false` means this namespace is only consumed internally, not exposed in flake outputs)
    (inputs.den.namespace username false)
  ];

  den.aspects.users.${username} = {
    # aspects to be included for this user regardless of host
    # (note that as of den v0.3.0, any `nixos` class modules in these includes are automatically
    # forwarded to all hosts this user is defined on; while `homeManager` class modules are
    # evaluated immediately within the context of this user as usual)
    includes = [
      den.batteries.primary-user

      ##########################################################################
      # aspects unchanged from the base config

      den.aspects.features.tools.wayland-utils

      ##########################################################################
      # aspects extending the base config with our own "private" config (using our custom namespace)

      # stupid nix seems to prevent us from using `${}` at the very beginning of the name, so we
      # have to use the full `den.ful.<namespace>` instead of just `<namespace>` here
      den.ful.${username}.features.desktop.niri
      den.ful.${username}.features.desktop.noctalia

      den.ful.${username}.features.terminal.fish
      den.ful.${username}.features.terminal.ghostty
      den.ful.${username}.features.terminal.kitty

      den.ful.${username}.features.editors.vim

      den.ful.${username}.features.tools.fastfetch
      den.ful.${username}.features.tools.git
      den.ful.${username}.features.tools.hyfetch
      den.ful.${username}.features.tools.ssh-client
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
