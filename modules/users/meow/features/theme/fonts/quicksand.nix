{ den, ... }: {
  meow.features.theme.fonts.quicksand = { usrSettings }:
    let
      fontName = "Quicksand";
    in
    {
      includes = [
        den.aspects.features.theme.fonts.quicksand
      ];

      usrSettings.theme.fonts.list.${fontName} = {
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
