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

          font_size = 14;

          ########################################################################
          # custom colorscheme
          # (for docs, see https://sw.kovidgoyal.net/kitty/conf/#color-scheme)

          background           = colors-${theme}.background;
          foreground           = colors-${theme}.foreground;

          selection_background = colors-${theme}.selection-background;
          selection_foreground = colors-${theme}.selection-foreground;

          cursor               = colors-${theme}.textcursor-background;
          cursor_text_color    = colors-${theme}.textcursor-foreground;

          # the 16 ANSI terminal colors
          color0               = colors.black;           # black
          color1               = colors.red;             # red
          color2               = colors.green;           # green
          color3               = colors.orange;          # yellow
          color4               = colors.blue-deep;       # blue
          color5               = colors.pink;            # magenta
          color6               = colors.blue;            # cyan
          color7               = colors.white-dark;      # white

          color8               = colors.black-light;     # brblack
          color9               = colors.orange-xdeep;    # brred
          color10              = colors.green-light;     # brgreen
          color11              = colors.orange-light;    # bryellow
          color12              = colors.blue-deep-light; # brblue
          color13              = colors.pink-light;      # brmagenta
          color14              = colors.blue-light;      # brblue
          color15              = colors.white;           # brwhite
        };
    };
  };
}
