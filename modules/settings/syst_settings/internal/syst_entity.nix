{ den, ... }: {
  # use `syst` entity type to encompass both hosts and homes (e.g. for `systSettings` options)
  den.schema.syst = {};
  den.schema.host.imports = [ den.schema.syst ];
  den.schema.home.imports = [ den.schema.syst ];
}
