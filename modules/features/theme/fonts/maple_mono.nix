{
  den.aspects.features.theme.fonts.maple-mono =
    let
      fontName = "Maple Mono NF";
    in
    {
      # make this font exist in `usrSettings`
      #usrSettings.theme.fonts.list.${fontName} = {};

      nixos = { pkgs, ... }: {
        fonts.packages = [
          pkgs.maple-mono.NF
        ];
      };

      homeManager = { pkgs, ... }: {
        home.packages = [
          pkgs.maple-mono.NF
        ];
      };
    };
}
