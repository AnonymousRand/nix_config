# use `profile` entity type to encompass both users and homes (currently for `settings` options)

{ den, lib, ... }: {
  options.den.profiles = lib.mkOption {
    type = lib.types.attrsOf (lib.types.submodule (
      { name, config, ... }: {
        freeformType = lib.types.attrsOf lib.types.anything;
        imports = [ den.schema.profil ];
        config._module.args.profil = config;
      }
    ));

    default = {};
  };

  config = {
    # need this to "register" the entity kind
    den.schema.profil = {};
  };
}
