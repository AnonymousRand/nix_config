{ den, ... }: {
  meow.features.theme.fonts.maple-mono = { config, ... }:
    let
      fontName = "Maple Mono NF";
    in
    {
      includes = [
        den.aspects.features.theme.fonts.maple-mono
      ];

      userSettings.theme.fonts.list.${fontName} = {
        size = {
          default = 12;
        };
        enabledFontFeatures = [
          # keep normal commas and semicolons
          "cv61"
        ];
        disabledFontFeatures = [
          # disable programming ligatures
          "calt"
        ];
      };
    };
}
