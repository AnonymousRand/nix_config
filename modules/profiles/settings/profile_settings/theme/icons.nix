{
  den.schema.profil = { config, lib, ... }:
    let
      aspCfg = config.settings.theme.icons;
      iconList = aspCfg.list;
    in
    {
      options.settings.theme.icons =
        let
          icon = lib.types.submodule {
            options = {
              iconThemeName = lib.mkOption {
                type = lib.types.str;
                description =
                  "the name of the icon theme within the package "
                  + "(e.g. as passed to home manager's `gtk.iconTheme.name`)";
              };

              package = lib.mkOption {
                type = lib.types.functionTo lib.types.package;
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

              default = lib.mkOption {
                type = lib.types.nullOr lib.types.str;
                default = null;
                apply = val:
                  if (iconList ? ${val} || val == null) then
                    val
                  else
                    let
                      iconListAttrNames = builtins.attrNames iconList;
                    in
                    throw (
                      "den.schema.profil.settings.theme.icons: the value \"${val}\" "
                      + "passed to `settings.theme.icons.default` "
                      + "is not listed in `settings.theme.icons.list`, which contains "
                      + "[ \"${builtins.concatStringsSep "\" \"" iconListAttrNames}\" ]"
                    );
              };
            };
          };

          default = {};
        };
    };
}
