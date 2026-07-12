{ config, lib, ... }: {
  options.meow.colors = with lib; {
    color-vars        = mkOption { type = types.attrs; };
    color-roles       = mkOption { type = types.attrs; };
    material3-palette = mkOption { type = types.attrs; };
  };


  config.meow.colors = rec {
    ############################################################################
    # basic color variables
    # (avoid using these directly in templates as much as possible)

    color-vars = {
      black            = "#000000";
      gray_xxdark      = "#202020";
      gray_xdark       = "#505050";
      gray_dark        = "#707070";
      gray             = "#808080";
      gray_light       = "#909090";
      gray_xlight      = "#a8a8a8";
      gray_xxlight     = "#cccccc";
      white            = "#ffffff";

      blue             = "#00eaff";
      blue_light       = "#66f2ff";
      blue_deep        = "#00caff";
      blue_xdeep       = "#00bbff";
      blue_xdeep_light = "#33c9ff";

      green            = "#8cff00";
      green_light      = "#a3ff33";
      green_deep       = "#8cff00";
      green_deep_dark  = "#76d600";
      green_deep_xdark = "#6fc900";

      orange           = "#ffd500";
      orange_light     = "#ffdb26";
      orange_xlight    = "#ffdf40";
      orange_deep      = "#ffbf00";
      orange_xdeep     = "#ffa600";
      orange_xxdeep    = "#ff9500";

      pink             = "#ff0080";
      pink_light       = "#ff8cc6";
      pink_xlight      = "#ffadd6";
      pink_xxlight     = "#ffcbe6";
      pink_xxxlight    = "#ffdeee";

      red              = "#ff0000";
    };
 
    ############################################################################
    # custom color roles/variables (currently in format for Noctalia custom colors)
    # (use these on things which very clearly have any of the following roles)

    color-roles = with color-vars; rec {
      default_bg = {
        color_light = "#feedf3";
        color_dark  = black;
      };
      default_fg = {
        color_light = gray_dark;
        color_dark  = gray_xxlight;
      };
      lighter_fg = {
        color_light = gray_xlight;
        color_dark  = gray;
      };


      selection_bg = {
        color_light = pink_xxxlight;
        color_dark  = pink_xxlight;
      };
      selection_fg = {
        color_light = default_fg.color_light;
        color_dark  = default_bg.color_dark;
      };


      search_bg      = selection_bg;
      search_fg      = selection_fg;
      search_curr_bg = {
        color_light = green_light;
        color_dark  = green_light;
      };
      search_curr_fg = search_fg;


      error   = {
        color_light = red;
        color_dark  = red;
      };
      warning = {
        color_light = orange_xxdeep;
        color_dark  = orange_deep;
      };


      classes   = {
        color_light = orange_xdeep;
        color_dark  = orange;
      };
      comments  = {
        color_light = green_deep_xdark;
        color_dark  = green_light;
      };
      constants = {
        color_light = blue_deep;
        color_dark  = blue_light;
      };
      functions = {
        color_light = orange_xdeep;
        color_dark  = orange;
      };
      keywords  = {
        color_light = pink_light;
        color_dark  = pink_xxlight;
      };
      links     = {
        color_light = blue_xdeep;
        color_dark  = blue;
      };
      variables = default_fg;
    };

    ############################################################################
    # Material 3 palette (e.g. for Noctalia palette)
    # (use these on things which very clearly have a Material 3 role, and Noctalia didn't change the color)
    # (although treat the terminal ANSI colors more like fixed color variables)

    material3-palette = {
      light = rec {
        mSurface          = color-roles.default_bg.color_light; # main background color
        mOnSurface        = color-roles.default_fg.color_light; # main foreground color
        mSurfaceVariant   = "#fffafc";                          # variant background color (cards, panels)
        mOnSurfaceVariant = color-vars.gray;                    # variant foreground color
        mPrimary          = color-vars.pink_light;              # primary accent (buttons, links, highlights)
        mOnPrimary        = color-vars.gray_xxdark;             # text on primary surfaces
        mSecondary        = color-vars.pink_xxlight;            # secondary accent
        mOnSecondary      = color-vars.gray_xdark;              # text on secondary surfaces
        mTertiary         = color-vars.pink_xxxlight;           # tertiary accent
        mOnTertiary       = color-vars.gray_dark;               # text on tertiary surfaces
        mOutline          = color-vars.pink_xlight;             # borders and dividers
        mShadow           = color-vars.gray_xdark;              # shadows
        mHover            = mSecondary;                         # hover state background
        mOnHover          = mOnSecondary;                       # text on hover surfaces
        mError            = color-roles.error.color_light;      # error color
        mOnError          = color-vars.black;                   # text on error surfaces

        terminal = rec {
          background  = mSurface;
          foreground  = mOnSurface;
          cursor      = color-vars.pink_xxlight;
          cursorText  = foreground;
          selectionBg = color-roles.selection_bg.color_light;
          selectionFg = color-roles.selection_fg.color_light;
          normal = {
            black   = color-vars.black;
            red     = color-vars.pink_light;
            green   = color-vars.green_deep_dark;
            yellow  = color-vars.orange_xdeep;
            blue    = color-vars.blue_xdeep_light;
            magenta = color-vars.pink_light;
            cyan    = color-vars.blue_deep;
            white   = color-vars.gray_xxlight;
          };
          bright = {
            black   = color-vars.gray_xdark;
            red     = color-vars.red;
            green   = color-vars.green_deep_xdark;
            yellow  = color-vars.orange_xdeep;
            blue    = color-vars.blue_xdeep;
            magenta = color-vars.pink_light;
            cyan    = color-vars.blue_deep;
            white   = color-vars.white;
          };
        };
      };

      dark = rec {
        mSurface          = color-roles.default_bg.color_dark;
        mOnSurface        = color-roles.default_fg.color_dark;
        mSurfaceVariant   = color-vars.gray_xxdark;
        mOnSurfaceVariant = color-vars.gray_xlight;
        mPrimary          = color-vars.pink_light;
        mOnPrimary        = color-vars.gray_xxdark;
        mSecondary        = color-vars.pink_xlight;
        mOnSecondary      = color-vars.gray_xxdark;
        mTertiary         = color-vars.pink_xxlight;
        mOnTertiary       = color-vars.gray_xdark;
        mOutline          = color-vars.pink_xlight;
        mShadow           = color-vars.gray_xdark;
        mHover            = mSecondary;
        mOnHover          = mOnSecondary;
        mError            = color-roles.error.color_dark;
        mOnError          = color-vars.black;

        terminal = rec {
          background  = mSurface;
          foreground  = mOnSurface;
          cursor      = color-vars.pink_xxlight;
          cursorText  = background;
          selectionBg = color-roles.selection_bg.color_dark;
          selectionFg = color-roles.selection_fg.color_dark;
          normal = {
            black   = color-vars.black;
            red     = color-vars.pink_xlight;
            green   = color-vars.green;
            yellow  = color-vars.orange;
            blue    = color-vars.blue_xdeep;
            magenta = color-vars.pink_xlight;
            cyan    = color-vars.blue;
            white   = color-vars.gray_xxlight;
          };
          bright = {
            black   = color-vars.gray_xdark;
            red     = color-vars.red;
            green   = color-vars.green_light;
            yellow  = color-vars.orange_light;
            blue    = color-vars.blue_xdeep_light;
            magenta = color-vars.pink_xxlight;
            cyan    = color-vars.blue_light;
            white   = color-vars.white;
          };
        };
      };
    };
  };
}
