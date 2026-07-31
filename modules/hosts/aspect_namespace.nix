{ den, ... }: {
  den.schema.host = { host, ... }: {
    # change default aspect name associated with host entities to fit our naming scheme
    # (note that this requires the target aspect to exist *first*)
    aspect = den.aspects.hosts.${host.name};
  };
}
