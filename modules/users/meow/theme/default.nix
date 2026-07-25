{
  den.aspects.users.meow = {
    homeManager = { lib, ... }: {
      # declare a `theme` submodule in `den.aspects.users.meow` (i.e. the `config` argument)
      # which takes options `colors`, `noctalia.customColors`, `noctalia.palette`, and `css`
      # (we declare this inside home manager class module since i don't want to separate features
      # adding templates to `programs.noctalia` and adding to `theme.noctalia.customColors`)
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
