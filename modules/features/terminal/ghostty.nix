{
  den.aspects.features.terminal.ghostty = {
    homeManager = { syst, user, lib, ... }:
      lib.mkIf (syst.settings.capabilities.has [ "graphics" ]) {
        programs.ghostty = {
          enable = true;
          # install vim plugin that provides syntax highlighting for ghostty config files
          installVimSyntax = true;

          settings =
            let
              fontSettings = user.settings.theme.fonts;
              monospaceFont = builtins.head fontSettings.defaults.monospace;
            in
            lib.optionalAttrs (monospaceFont != []) {
              # load in font user settings (note that ghostty's defaults seem to
              # override fontconfig's, so setting this explicitly here is needed)
              font-family  = monospaceFont;
              font-size    = fontSettings.list.${monospaceFont}.size.normal;
              font-feature =
                builtins.concatStringsSep ", " (
                  fontSettings.list.${monospaceFont}.enabledFontFeatures
                  ++ (
                    lib.map (name: "-${name}")
                      fontSettings.list.${monospaceFont}.disabledFontFeatures
                  )
                );
            };
        };
      };
  };
}
