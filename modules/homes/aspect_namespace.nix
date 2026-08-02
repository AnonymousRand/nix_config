{ den, ... }: {
  den.schema.home = { home, ... }: {
    # change default aspect name associated with host entities to fit our naming scheme
    # (note that this requires the target aspect to exist *first*)
    aspect = den.aspects.users.${home.name};
  };
}
