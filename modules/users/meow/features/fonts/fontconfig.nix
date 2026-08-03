{ den, ... }: {
  meow.features.fonts.fontconfig = {
    includes = [
      den.aspects.features.fonts.fontconfig
    ];

    homeManager = {
      fonts.fontconfig = {
        defaultFonts = {
          sansSerif = [ "Quicksand Medium" ];
          monospace = [ "Maple Mono NF" ];
        };
      };
    };
  };
}
