{ den, ... }: {
  meow.features.theme.fonts.fontconfig = {
    includes = [
      den.aspects.features.theme.fonts.fontconfig
    ];

    homeManager = {
      fonts.fontconfig = {
        defaultFonts = {
          serif     = [ "Quicksand Medium" ];
          sansSerif = [ "Quicksand Medium" ];
          monospace = [ "Maple Mono NF" ];
        };
      };
    };
  };
}
