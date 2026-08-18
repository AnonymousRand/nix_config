{
  den.schema.usr = { lib, ... }: {
    options.usrSettings = {
      username = lib.mkOption {
        type = lib.types.str;
      };
    };

    imports = [
      ({ user ? null, home ? null, ... }: {
        # for some reason checking if either `user` or `home` is not null causes infinite recursion;
        # and also for some reason it seems like it can never happen that both are null
        usrSettings.username =
          if (user ? name) then
            user.name
          else (
            if (home ? name) then
              home.name
            else
              throw "den.schema.usr.usrSettings.username: this shouldn't be possible!"
          );
      })
    ];
  };
}
