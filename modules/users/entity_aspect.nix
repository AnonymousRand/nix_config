{ den, ... }: {
  den.schema.user = { user, lib, ... }: {
    # change default aspect name(s) associated with user entities to fit our naming scheme
    # (note that this requires the target aspect(s) to exist *first*), and also include base aspect
    # IMPORTANT: our current code (and it seems, den 0.19.0's) does not make any differences
    # between host entities' `name` and `hostName`, so they MUST always be the same!!
    aspect = {
      includes =
        [ den.aspects.users.base ]
        ++ (
          lib.optional (lib.hasAttrByPath [ "users" user.name ] den.aspects)
            den.aspects.users.${user.name}
        )
        ++ (
          lib.optional
            (lib.hasAttrByPath [ "user-host" "${user.name}@${user.host.name}" ] den.aspects)
            den.aspects.user-host."${user.name}@${user.host.name}"
        );
    };
  };
}
