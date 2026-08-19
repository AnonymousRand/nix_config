{ den, ... }: {
  # use `usr` entity type to encompass both users and homes (e.g. for `usrSettings` options)
  den.schema.usr = {};
  den.schema.user.imports = [ den.schema.usr ];
  den.schema.home.imports = [ den.schema.usr ];
}
