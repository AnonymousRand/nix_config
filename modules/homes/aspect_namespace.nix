{ den, ... }: {
  den.schema.home = { home, lib, ... }: {
    # change default aspect names associated with home entities to fit our naming scheme
    # (note that this requires the target aspects to exist *first*)
    # also note that as of den 0.19.0, this is basically how the home entity's aspect is defined
    aspect = {
      includes =
        # use `den.aspects.homes.<username>@<hostname>` for standalone home config,
        # and `den.aspects.users.<username>@<hostname>` for host-specific user config
        # (currently, we shouldn't really need to use the latter, since this is a bit confusing)
        (
          lib.optional (lib.hasAttrByPath [ "homes" home.name ] den.aspects)
            den.aspects.homes.${home.name}
        )
        ++ (
          lib.optional (lib.hasAttrByPath [ "users" home.userName ] den.aspects)
            den.aspects.users.${home.userName}
        );
    };
  };
}
