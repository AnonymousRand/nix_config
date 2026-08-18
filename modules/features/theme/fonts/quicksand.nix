{
  den.aspects.features.theme.fonts.quicksand =
    let
      fontName = "Quicksand";
    in
    {
      # make this font exist in `userSettings`
      userSettings.theme.fonts.list.${fontName} = {};

      nixos = { pkgs, ... }: {
        fonts.packages = [
          pkgs.quicksand
        ];
      };

      homeManager = { pkgs, ... }: {
        home.packages = [
          pkgs.quicksand
        ];
      };
    };
}
