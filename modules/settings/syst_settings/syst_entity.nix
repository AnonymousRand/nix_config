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
    den.schema.syst.isEntity = true;

    den.policies.host-to-syst = { host, ... }: builtins.trace "host-to-syst 1" [
      (den.lib.policy.resolve.shared.to "syst" {
        syst = builtins.trace "host-to-syst 2" lib.mkMerge [ host (den.systs.${host.name} or {}) ];
      })
    ];

    # IMPORTANT: for this to work, all homes MUST be bound to a host!
    den.policies.home-to-syst = { home, ... }: [
      (den.lib.policy.resolve.shared.to "syst" {
        syst = lib.mkMerge [ home (den.systs.${home.hostName} or {}) ];
      })
    ];

    den.schema.host.includes = [ den.policies.host-to-syst ];
    den.schema.home.includes = [ den.policies.home-to-syst ];
  };
}
