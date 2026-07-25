{ den, ... }: {
  den.schema.user = { user, ... }: {
    # change default aspect name associated with user entities to fit our naming scheme
    aspect = den.aspects.users.${user.name};
  };
}
