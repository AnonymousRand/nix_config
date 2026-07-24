{ den, ... }: {
  den.aspects.meow = {
    includes = [
      den.batteries.primary-user
    ];

    nixos = { user, ... }: {
      users.users.${user.userName}.description = "AnonymousRand";
    };

    homeManager = {
      home.sessionVariables = {
        TERMINAL = "ghostty";
      };

      programs.vim = {
        defaultEditor = true;
      };
    };

    # add to configurations of every host this user is on
    # (e.g. user-specific features that require system-level permissions, like window managers)
    provides.to-hosts = {
      includes = [
        den.aspects.niri
        den.aspects.noctalia

        den.aspects.wayland-utils
      ];
    };
  };
}
