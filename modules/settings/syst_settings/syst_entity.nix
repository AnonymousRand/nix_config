{ den, ... }: {
  # use `syst` entity type to encompass both hosts and homes (e.g. for capability options)
  den.schema.host.imports = [ den.schema.syst ];
  den.schema.home.imports = [ den.schema.syst ];
}
