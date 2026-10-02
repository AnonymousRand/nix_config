{ den, ... }: {
  # TODO try doing in one with den.schema.systm and taking syst ctx?
  den.schema.host = { host, lib, ... }: {
    # change default aspect name(s) associated with host entities to fit our naming scheme
    # (note that this requires the target aspect(s) to exist *first*)
    aspect = {
      includes = (
        lib.optional (lib.hasAttrByPath [ "systs" host.name ] den.aspects)
          den.aspects.systs.${host.name}
      );
    };
  };

  den.schema.home = { home, lib, ... }: {
    # change default aspect names associated with home entities to fit our naming scheme
    # (note that this requires the target aspects to exist *first*)
    # also note that as of den 0.19.0, this is basically how the home entity's aspect is defined
    # and this should preserve the behavior of unbound homes only being linked to the user aspect
    aspect = {
      includes =
        # use `user-host` instead of something like `homes` so that these aspects continue to
        # provide for both homes and host-specific user config like they do in den originally
        (
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
