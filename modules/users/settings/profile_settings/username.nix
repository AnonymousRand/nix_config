{
  den.schema.profil = { lib, ... }: {
    # i couldn't figure out how to set a default using `user` or `home`, so set it manually
    options.settings.username = lib.mkOption {
      type = lib.types.str;
    };
  };
}
