# use `syst` entity type to encompass both hosts and homes (currently for `settings` options)

{ den, lib, ... }: {
  options.den.systs = lib.mkOption {
    type = lib.types.attrsOf (lib.types.submodule (
      { name, config, ... }: {
        freeformType = lib.types.attrsOf lib.types.anything;
        imports = [ den.schema.syst ];
        config._module.args.syst = config;
      }
    ));

    default = {};
  };

  config = {
    den.schema.syst = {};

    #den.policies.syst-to-home-and-host = { host ? null, home ? null, ... }: [
    #  (den.lib.policy.resolve {
    #    syst =
    #      if (host != null) then
    #        den.systs.${host.name}
    #      else (
    #        if (home != null) then
    #          den.systs.${home.hostName}
    #        else
    #          throw "den.policies.add-syst-ctx: this shouldn't be possible!"
    #      );
    #    })
    #  ];

    #den.schema.host.includes = [ den.policies.syst-to-home-and-host ];
    #den.schema.home.includes = [ den.policies.syst-to-home-and-host ];

    den.policies.host-to-syst = { host, ... }: builtins.trace "host-to-syst 1" [
      (den.lib.policy.resolve {
        syst = builtins.trace "host-to-syst 2" lib.mkMerge [ host (den.systs.${host.name} or {}) ];
      })
    ];

    # IMPORTANT: for this to work, all homes MUST be bound to a host!
    den.policies.home-to-syst = { home, ... }: [
      (den.lib.policy.resolve {
        syst = lib.mkMerge [ home (den.systs.${home.hostName} or {}) ];
      })
    ];

    #den.schema.host.includes = [ den.policies.host-to-syst ];
    #den.schema.home.includes = [ den.policies.home-to-syst ];
  };
}
