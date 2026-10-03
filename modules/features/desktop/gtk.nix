{
  den.aspects.features.desktop.gtk = {
    homeManager = { syst, profile, config, lib, pkgs, ... }:
      lib.mkIf (syst.settings.capabilities.has [ "graphics" ]) {
        gtk =
          let
            fontSettings = profile.settings.theme.fonts;
            fontParams = fontType:
              if (fontSettings.defaults.${fontType} != []) then rec {
                name = builtins.head fontSettings.defaults.${fontType};
                size = fontSettings.list.${name}.size.gtk;
                dconfSizeStr = " ${builtins.toString size}";
              } else {
                name = "";
                size = null;
                dconfSizeStr = "";
              };
            defaultFont = fontParams "general";
            monospaceFont = fontParams "monospace";

            iconSettings = profile.settings.theme.icons;
          in
          {
            enable = true;
            gtk3.enable = true;
            gtk4.enable = true;

            font = rec {
              name = defaultFont.name;
              size = defaultFont.size;
            };

            iconTheme =
              if (iconSettings.default != null) then
                let
                  defaultIcon = iconSettings.list.${iconSettings.default};
                in
                {
                  name = defaultIcon.iconThemeName;
                  package = defaultIcon.package pkgs;
                }
              else
                {};
          };
      };
  };
}
