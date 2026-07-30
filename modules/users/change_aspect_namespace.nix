{ den, ... }: {
  den.schema.user = { user, ... }: {
    # change default aspect name associated with user entities to fit our naming scheme
    # (note that this requires the target aspect to exist *first*)
    aspect = den.aspects.users.${user.name};
  };
}
