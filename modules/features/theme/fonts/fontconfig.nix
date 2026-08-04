{
  den.aspects.features.theme.fonts.fontconfig = {
    homeManager = { userSettings, ... }: {
      fonts.fontconfig = {
        enable = true;
        antialiasing = true;
        hinting = "slight";
        defaultFonts = userSettings.theme.fonts.defaults or {};
      };
    };
  };
}
