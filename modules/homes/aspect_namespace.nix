{ den, ... }: {
  den.schema.home = { home, lib, ... }: {
    # change default aspect names associated with home entities to fit our naming scheme
    # (note that this requires the target aspects to exist *first*)
    # also note that as of den 0.19.0, this is basically how the home entity's aspect is defined
    aspect = {
      includes =
        [ den.aspects.user-host.base ]
        ++ (
          lib.optional (lib.hasAttrByPath [ "user-host" home.name ] den.aspects)
            den.aspects.user-host.${home.name}
        )
        ++ (
          lib.optional (lib.hasAttrByPath [ "users" home.userName ] den.aspects)
            den.aspects.users.${home.userName}
        );
    };
  };
}
