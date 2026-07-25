{
  den.aspects.users.meow = {
    homeManager = { lib, ... }: {
      # declare a `theme` submodule in `den.aspects.users.meow` (i.e. the `config` argument)
      # which takes options `colors`, `noctalia.customColors`, `noctalia.palette`, and `css`
      # (declared as an option inside home manager class module instead of at the aspect level
      # so that it can be set from within home manager class modules of aspects, preventing this
      # and applying noctalia templates from being split up inside feature aspects)
      options.theme = lib.mkOption {
        type = lib.types.submodule {
          options = {
            colors = lib.mkOption {
              type = lib.types.attrsOf lib.types.anything;
            };

            noctalia = lib.mkOption {
              type = lib.types.submodule {
                options = {
                  customColors = lib.mkOption {
                    type = lib.types.attrsOf lib.types.anything;
                  };

                  palette = lib.mkOption {
                    type = lib.types.attrsOf lib.types.anything;
                  };
                };
              };
            };

            css = lib.mkOption {
              type = lib.types.package;
            };
          };
        };
      };
    };
  };
}
