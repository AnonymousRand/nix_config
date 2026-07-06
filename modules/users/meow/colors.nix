{ lib, config, ... }: {
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
      black           = "#000000";
      black-light     = "#808080";

      blue            = "#00eaff";
      blue-light      = "#40efff";
      blue-deep       = "#00aaff";
      blue-deep-light = "#40bfff";

      green           = "#8cff00";
      green-light     = "#a9ff40";

      orange          = "#ffd500";
      orange-deep     = "#ffbf00";
      orange-xdeep    = "#ffa200";

      pink            = "#ff0080";
      pink-light      = "#ff9ed8";
      pink-xlight     = "#ffbdde";
      pink-xxlight    = "#ffd1e8";
      pink-xxxlight   = "#ffe3f1";

      red             = "#ff0000";

      white           = "#ffffff";
      white-dark      = "#cccccc";
    };
 
    ############################################################################
    # custom color roles/variables (currently in format for Noctalia custom colors)
    # (use these on things which very clearly have any of the following roles!)

    color-roles = with color-vars; rec {
      default_bg = {
        color_light = "#ffebf2";
        color_dark  = black;
      };
      default_fg = {
        color_light = "#303030";
        color_dark  = white-dark;
      };


      selection_bg = {
        color_light = pink-xxlight;
        color_dark  = pink-xxlight;
      };
      selection_fg = {
        color_light = default_fg.color_light;
        color_dark  = default_bg.color_dark;
      };
      selection_discreet_bg = {
        color_light = pink-xxlight;
        color_dark  = "#484848";
      };
      selection_discreet_fg = default_fg;


      error = {
        color_light = red;
        color_dark  = red;
      };
      warning = {
        color_light = orange-xdeep;
        color_dark  = orange-deep;
      };


      classes = {
        color_light = orange;
        color_dark  = orange;
      };
      comments = {
        color_light = green;
        color_dark  = green-light;
      };
      constants = {
        color_light = blue;
        color_dark  = blue-light;
      };
      functions = {
        color_light = orange-deep;
        color_dark  = orange;
      };
      keywords = {
        color_light = pink-xlight;
        color_dark  = pink-xxlight;
      };
      variables = default_fg;
    };

    ############################################################################
    # Material 3 palette (e.g. for Noctalia palette)
    # (use these on things which very clearly have a Material 3 role!)
    # (although treat the terminal ANSI colors more like fixed color variables)

    material3-palette = {
      light = rec {
        mSurface          = color-roles.default_fg.color_light; # main background color
        mOnSurface        = color-roles.default_bg.color_light; # main foreground color
        mSurfaceVariant   = color-vars.white;                   # secondary background color (cards, panels)
        mOnSurfaceVariant = mOnSurface;                         # secondary foreground color
        mPrimary          = color-vars.pink-xlight;             # primary accent (buttons, links, highlights)
        mOnPrimary        = color-vars.black;                   # text on primary surfaces
        mSecondary        = color-vars.orange-light;            # secondary accent
        mOnSeconary       = mOnPrimary;                         # text on secondary surfaces
        mTertiary         = color-vars.blue-light;              # tertiary accent
        mOnTertiary       = mOnPrimary;                         # text on tertiary surfaces
        mError            = color-vars.red;                     # error color
        mOnError          = color-vars.black;                   # text on error surfaces
        mOutline          = color-vars.pink-xlight;             # borders and dividers
        mShadow           = mSurface;                           # shadows
        mHover            = mTertiary;                          # hover state background
        mOnHover          = mOnTertiary;                        # text on hover surfaces
        terminal = rec {
          background  = mSurface;
          foreground  = mOnSurface;
          cursor      = color-vars.pink-xxlight;
          cursorText  = foreground;
          selectionBg = color-roles.selection_discreet_bg.color_light;
          selectionFg = color-roles.selection_discreet_fg.color_light;
          normal = {
            black   = color-vars.black;
            red     = color-vars.pink-light;
            green   = color-vars.green;
            yellow  = color-vars.orange-xdeep;
            blue    = color-vars.blue-deep;
            magenta = color-vars.pink-light;
            cyan    = color-vars.blue;
            white   = color-vars.white-dark;
          };
          bright = {
            black   = color-vars.black-light;
            red     = color-vars.red;
            green   = color-vars.green-light;
            yellow  = color-vars.orange-deep;
            blue    = color-vars.blue-deep-light;
            magenta = color-vars.pink-xlight;
            cyan    = color-vars.blue-light;
            white   = color-vars.white;
          };
        };
      };

      dark = rec {
        mSurface          = color-roles.default_bg.color_dark;
        mOnSurface        = color-roles.default_fg.color_dark;
        mSurfaceVariant   = "#202020";
        mOnSurfaceVariant = mOnSurface;
        mPrimary          = color-vars.pink-xlight;
        mOnPrimary        = color-vars.black;
        mSecondary        = color-vars.orange-light;
        mOnSeconary       = mOnPrimary;
        mTertiary         = color-vars.blue-light;
        mOnTertiary       = mOnPrimary;
        mError            = color-vars.red;
        mOnError          = color-vars.black;
        mOutline          = color-vars.pink-xxlight;
        mShadow           = mSurface;
        mHover            = mTertiary;
        mOnHover          = mOnTertiary;
        terminal = rec {
          background  = mSurface;
          foreground  = mOnSurface;
          cursor      = color-vars.pink-xxlight;
          cursorText  = background;
          selectionBg = color-roles.selection_discreet_bg.color_dark;
          selectionFg = color-roles.selection_discreet_fg.color_dark;
          normal = {
            black   = color-vars.black;
            red     = color-vars.pink-light;
            green   = color-vars.green;
            yellow  = color-vars.orange-deep;
            blue    = color-vars.blue-deep;
            magenta = color-vars.pink-xlight;
            cyan    = color-vars.blue;
            white   = color-vars.white-dark;
          };
          bright = {
            black   = color-vars.black-light;
            red     = color-vars.red;
            green   = color-vars.green-light;
            yellow  = color-vars.orange;
            blue    = color-vars.blue-deep-light;
            magenta = color-vars.pink-xxlight;
            cyan    = color-vars.blue-light;
            white   = color-vars.white;
          };
        };
      };
    };
  };
}
