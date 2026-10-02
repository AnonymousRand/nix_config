# use `syst` entity type to encompass both hosts and homes (currently for `settings` options)
# NOTE: currently the schema is called `systm` because for some reason the `add-syst-ctx` policy
# breaks if the context arg it's defining has the same name as the schema kind

{ den, lib, ... }: {
  options.den.systs = lib.mkOption {
    type = lib.types.attrsOf (lib.types.submodule (
      { name, config, ... }: {
        freeformType = lib.types.attrsOf lib.types.anything;
        imports = [ den.schema.systm ];
        config._module.args.systm = config;
      }
    ));

    default = {};
  };

  config = {
    # need this to "register" the entity kind
    den.schema.systm = {};

    den.policies.host-to-syst = { host, ... }: [
      (den.lib.policy.resolve {
        # (`lib.mkMerge`ing the syst and the host/home doesn't seem to work, hence syst only)
        syst = den.systs.${host.name} or {};
      })
    ];

    # IMPORTANT: for this to work, all homes MUST be bound to a host!
    den.policies.home-to-syst = { home, ... }: [
      (den.lib.policy.resolve {
        syst = den.systs.${home.hostName} or {};
      })
    ];

    den.schema.host.includes = [ den.policies.host-to-syst ];
    den.schema.home.includes = [ den.policies.home-to-syst ];
  };
}
