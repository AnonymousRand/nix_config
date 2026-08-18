{ den, ... }: {
  meow.features.theme.fonts.quicksand = { userSettings }:
    let
      fontName = "Quicksand";
    in
    {
      includes = [
        den.aspects.features.theme.fonts.quicksand
      ];

      userSettings.theme.fonts.list.${fontName} = {
        size = {
          default = 12;
          gtk = 12.1;
        };
        weight = {
          fontconfig = 180;
        };
      };
    };
}
