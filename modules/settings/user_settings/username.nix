{
  den.aspects.users.base = { user ? null, home ? null, lib, ... }: {
    imports = [
      {
        options.userSettings = {
          username = lib.mkOption {
            type = lib.types.str;
            readOnly = true;
            default =
              if user ? name then
                user.name
              else (
                if home ? name then
                  home.name
                else
                  throw "`userSettings`: missing option values for `username`!"
              );
          };
        };
      }
    ];
  };
}
