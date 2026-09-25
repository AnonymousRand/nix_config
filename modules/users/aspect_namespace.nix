{ den, ... }: {
  den.schema.user = { user, lib, ... }: {
    # change default aspect names associated with user entities to fit our naming scheme
    # (note that this requires the target aspects to exist *first*)
    # also note that as of den 0.19.0, this is basically how the user entity's aspect is defined
    aspect = {
      includes =
        (
          lib.optional (lib.hasAttrByPath [ "users" user.name ] den.aspects)
            den.aspects.users.${user.name}
        )
        # use `den.aspects.users.<username>@<hostname>` for host-specific user config,
        # and `den.aspects.homes.<username>@<hostname>` for standalone home config
        # (currently, we shouldn't really need to use the former, since this is a bit confusing)
        ++ (
          lib.optional (lib.hasAttrByPath [ "users" "${user.name}@${user.host.name}" ] den.aspects)
            den.aspects.users."${user.name}@${user.host.name}"
        );
    };
  };
}
