{
  flake.homeModules.meow = { config, ... }: {
    programs.kitty = {
      enable = true;
      shellIntegration.enableFishIntegration = true;
      let
        theme = "dark"; # TODO eventually replace
      in
        settings = with config.meow; {
          shell = "fish";

          ########################################################################
          # custom colorscheme

          background = colors-${theme}.background;
          foreground = colors-${theme}.foreground;

          selection_background = colors-${theme}.selection-background;
          selection_foreground = colors-${theme}.selection-foreground;

          cursor = colors-${theme}.textcursor-background;
          cursor_text_color = colors-${theme}.textcursor-foreground;

          # the 16 ANSI terminal colors
          color0 = colors.black;
          color1 = colors.red;
          color2 = colors.green;
          color3 = colors.orange;
          color4 = colors.blue-deep;
          color5 = colors.pink;
          color6 = colors.blue;
          color7 = colors.white-dark;

          color8 = colors.black-light;
          color9 = colors.red-light;
          color10 = colors.green-light;
          color11 = colors.orange-light;
          color12 = colors.blue-deep-light;
          color13 = colors.pink-light;
          color14 = colors.blue-light;
          color15 = colors.white;
        };
    };
  };
}
