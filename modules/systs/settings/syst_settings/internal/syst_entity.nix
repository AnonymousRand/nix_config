# use `syst` entity type to encompass both hosts and homes (e.g. for `systSettings` options)

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

    # we use `systs.host` instead of just `host` so that it receives the `den.schema.syst` import
    den.policies.host-to-syst = { host, ... }: [
      (den.lib.policy.resolve.shared.to "syst" {
        syst = den.systs.${host.name};
      })
    ];
  };
}
