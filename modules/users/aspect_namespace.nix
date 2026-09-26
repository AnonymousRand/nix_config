{ den, ... }: {
  den.schema.user = { user, lib, ... }: {
    # change default aspect name(s) associated with user entities to fit our naming scheme
    # (note that this requires the target aspect(s) to exist *first*)
    aspect = lib.optionalAttrs (lib.hasAttrByPath [ "users" user.name ] den.aspects)
      den.aspects.users.${user.name};
    aspect = {
      includes =
        (
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
