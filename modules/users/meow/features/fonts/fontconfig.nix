{ den, ... }: {
  meow.features.fonts.fontconfig = {
    includes = [
      den.aspects.features.fonts.fontconfig
    ];

    homeManager = {
      fonts.fontconfig = {
        defaultFonts = {
          monospace = [ "Maple Mono NF" ];
        };
      };
    };
  };
}
