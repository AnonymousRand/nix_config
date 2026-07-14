{ inputs, ... }: {
  flake.homeModules.meow = { my, lib, ... }: {
    imports = [
      inputs.noctalia.homeModules.default
    ];

    programs.noctalia = {
      enable = true;
      settings = my.theme.noctaliaSettings;
    };

    xdg.configFile."noctalia/palettes/anonymousrand.json".text = builtins.toJSON my.theme.colors.m3Palette;
  };
}
