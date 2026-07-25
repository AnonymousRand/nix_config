{
  den.quirks.noctalia-palette = {
    description = "Custom palette for noctalia";
  };

  den.quirks.noctalia-custom-colors = {
    description = "Custom colors to be sent to noctalia for theming";
  };

  den.quirks.noctalia-templates = {
    description = "Templates to be rendered by noctalia";
  };

  # include this aspect in a user to let noctalia consume the quirks above and render all templates
  # (giving us an easy way to toggle noctalia theming)
  den.aspects.utils.noctalia-theming = {
    homeManager = { noctalia-custom-colors, noctalia-templates, ... }: {
      # apply collected palette to noctalia
      xdg.configFile."noctalia/palettes/anonymousrand.json".text =
          builtins.toJSON config.meow.theme.colors.m3Palette;

      programs.noctalia.settings.theme.templates = {
        # apply all collected custom colors to noctalia
        custom_colors = noctalia-custom-colors;
        # add all collected templates to render list
        user = noctalia-templates;
      };
    };
  };
}
