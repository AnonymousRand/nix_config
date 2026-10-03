{ den, ... }: {
  den.schema.host = { host, lib, ... }: {
    # change default aspect name(s) associated with host entities to fit our naming scheme
    # (note that this requires the target aspect(s) to exist *first*)
    aspect = {
      includes =
        (
          lib.optional (lib.hasAttrByPath [ "hosts" host.name ] den.aspects)
            den.aspects.hosts.${host.name}
        )
        ++ [ den.aspects.hosts.base or {} ]
        ++ (
          lib.optional (lib.hasAttrByPath [ "systs" host.name ] den.aspects)
            den.aspects.systs.${host.name}
        )
        ++ [ den.aspects.systs.base or {} ];
    };
  };

  den.schema.home = { home, lib, ... }: {
    # change default aspect names associated with home entities to fit our naming scheme
    # (note that this requires the target aspects to exist *first*)
    # also note that as of den 0.19.0, this is basically how the home entity's aspect is defined
    # and this should preserve the behavior of unbound homes only being linked to the user aspect
    aspect = {
      includes =
        # use `user-hosts` instead of something like `homes` so that these aspects continue to
        # provide for both homes and host-specific user config like they do in den originally
        (
          lib.optional (lib.hasAttrByPath [ "user-hosts" home.name ] den.aspects)
            den.aspects.user-hosts.${home.name}
        )
        ++ [ den.aspects.user-hosts.base or {} ]
        ++ (
          lib.optional (lib.hasAttrByPath [ "systs" home.hostName ] den.aspects)
            den.aspects.systs.${home.hostName}
        )
        ++ [ den.aspects.systs.base or {} ]
        ++ (
          lib.optional (lib.hasAttrByPath [ "profiles" home.userName ] den.aspects)
            den.aspects.profiles.${home.userName}
        )
        ++ [ den.aspects.profiles.base or {} ];
    };
  };
}
