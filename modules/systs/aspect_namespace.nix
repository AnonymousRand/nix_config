{ den, ... }: {
  den.schema.host = { host, lib, ... }: {
    # change default aspect name(s) associated with host entities to fit our naming scheme
    # (note that this requires the target aspect(s) to exist *first*)
    aspect = {
      includes =
        [
          den.aspects.systs.base
          den.aspects.hosts.base
        ]
        ++ (
          lib.optional (lib.hasAttrByPath [ "hosts" host.name ] den.aspects)
            den.aspects.hosts.${host.name}
        );
    };
  };

  den.schema.home = { home, lib, ... }: {
    aspect = {
      includes =
        [
          den.aspects.systs.base
        ]
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
