{
  den.aspects.features.theme.fonts.fontconfig = { userSettings }: {
    homeManager = {
      fonts.fontconfig = {
        enable = true;
        antialiasing = true;
        hinting = "slight";
        defaultFonts = userSettings.theme.fonts.defaults or {};
      };
    };
  };
}
