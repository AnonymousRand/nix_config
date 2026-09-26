{
  den.schema.profile = { lib, ... }: {
    options.settings = {
      username = lib.mkOption {
        type = lib.types.str;
      };
    };

    imports = [
      ({ user ? null, home ? null, ... }: {
        # for some reason checking if either `user` or `home` is not null causes infinite recursion
        # also it seems like it can never happen that both are null
        settings.username =
          if (user ? name) then
            user.name
          else (
            if (home ? name) then
              home.name
            else
              throw "den.schema.profile.settings.username: this shouldn't be possible!"
          );
      })
    ];
  };
}
