{
  den.schema.profil = { config, lib, ... }:
    let
      aspCfg = config.settings.theme.icons;
      iconList = aspCfg.list;
    in
    {
      options.settings.theme.icons =
        let
          icon = lib.types.submodule ({ name, ... }: {
            options = {
              package = lib.mkOption {
                type = lib.types.package;
              };
            };
          };
        in
        lib.mkOption {
          type = lib.types.submodule {
            options = {
              list = lib.mkOption {
                type = lib.types.attrsOf icon;
                default = {};
              };

              default =
                let
                   = icons:
                    builtins.foldl' (acc: new: acc && (iconList ? ${new})) true icons;
                in
                lib.mkOption {
                  type = lib.types.nullOr lib.types.str;
                  default = null;
                  apply = val:
                    if (iconList ? val) then
                      val
                    else
                      throw (
                        "den.schema.profil.settings.theme.icons: the value ${val}"
                        + "passed to `settings.theme.icons.default"
                        + "contains a icon not listed in `settings.theme.icons.list`!"
                      );
                  };
              };
            };
          };

          default = {};
    };
}
