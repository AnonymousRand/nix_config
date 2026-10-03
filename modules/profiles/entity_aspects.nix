{ den, ... }: {
  den.schema.user = { user, lib, ... }: {
    # change default aspect name(s) associated with user entities to fit our naming scheme
    # (note that this requires the target aspect(s) to exist *first*)
    # IMPORTANT: our current code (and it seems, den 0.19.0's) does not make any differences
    # between host entities' `name` and `hostName`, so they MUST always be the same!!
    aspect = {
      includes =
        (
          lib.optional (lib.hasAttrByPath [ "profiles" user.name ] den.aspects)
            den.aspects.profiles.${user.name}
        )
        ++ [ den.aspects.profiles.base or {} ]
        ++ (
          lib.optional
            (lib.hasAttrByPath [ "user-hosts" "${user.name}@${user.host.name}" ] den.aspects)
            den.aspects.user-hosts."${user.name}@${user.host.name}"
        )
        ++ [ den.aspects.user-hosts.base or {} ];
    };
  };
}
