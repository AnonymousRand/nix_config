{ den, lib, ... }: {
  # allow host and home entities to override syst-schema options (see policies)
  #
  # currently commented out since it does cause issues where if some options are not set in the
  # host/home entity, then the merged `syst` context arg will not have it set either instead of
  # defaulting to the syst entity's version. this is probably because we're using
  # `lib.recursiveUpdate` instead of `lib.mkMerge` in the policies; `lib.mkMerge` has problems of
  # its own, whereas schemas are freeform so we don't technically need to declare the options
  # that we set. tl;dr we can still override settings without these schema imports
  #den.schema.host.imports = [ den.schema.syst ];
  #den.schema.home.imports = [ den.schema.syst ];

  den.policies.host-to-syst = { host, ... }: [
    (den.lib.policy.resolve {
      # `lib.mkMerge` doesn't seem to work, hence `recursiveUpdate`; with the more specific
      # entity taking precedence over the general syst entity
      syst = lib.recursiveUpdate (den.systs.${host.name} or {}) host;
    })
  ];

  # IMPORTANT: for this to work, all homes MUST be bound to a host!
  den.policies.home-to-syst = { home, ... }: [
    (den.lib.policy.resolve {
      syst = lib.recursiveUpdate (den.systs.${home.hostName} or {}) home;
    })
  ];

  den.schema.host.includes = [ den.policies.host-to-syst ];
  den.schema.home.includes = [ den.policies.home-to-syst ];
}
