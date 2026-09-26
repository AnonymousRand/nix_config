{ den, ... }: {
  # use `profile` entity type to encompass both users and homes (e.g. for `profileSettings` options)
  den.schema.profile = {};
  den.schema.user.imports = [ den.schema.profile ];
  den.schema.home.imports = [ den.schema.profile ];
}
