{ den, ... }: {
  den.schema.host = { host, lib, ... }: {
    # change default aspect name(s) associated with host entities to fit our naming scheme
    # (note that this requires the target aspect(s) to exist *first*)
    aspect = {
      includes =
        [ den.aspects.hosts.base ]
        ++ (
          lib.optionalAttrs (lib.hasAttrByPath [ "hosts" host.name ] den.aspects)
            den.aspects.hosts.${host.name};
        );
    };
  };
}
