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
      black             = "#000000";
      gray-xdark        = "#303030";
      gray-dark         = "#606060";
      gray              = "#808080";
      gray-light        = "#a0a0a0";
      gray-xlight       = "#cccccc";
      white             = "#ffffff";

      blue              = "#00eaff";
      blue-light        = "#40efff";
      blue-deep         = "#00d5ff";
      blue-deep-dark    = "#00ccf5";
      blue-xdeep        = "#00bfff";
      blue-xdeep-light  = "#40cfff";

      green             = "#8cff00";
      green-light       = "#a9ff40";
      green-deep        = "#8cff00";
      green-deep-dark   = "#76d600";
      green-deep-xdark  = "#6fc900";

      orange            = "#ffd500";
      orange-light      = "#ffdb26";
      orange-deep       = "#ffbf00";
      orange-xdeep      = "#ffa200";

      pink              = "#ff0080";
      pink-light        = "#ff66b3";
      pink-xlight       = "#ffa6d2";
      pink-xxlight      = "#ffc7e3";
      pink-xxxlight     = "#ffd1e8";
      pink-xxxxlight    = "#ffe0f0";

      red               = "#ff0000";
    };
 
    ############################################################################
    # custom color roles/variables (currently in format for Noctalia custom colors)
    # (use these on things which very clearly have any of the following roles!)

    color-roles = with color-vars; rec {
      default_bg = {
        color_light = "#fff7fa";
        color_dark  = black;
      };
      default_fg = {
        color_light = gray-dark;
        color_dark  = gray-xlight;
      };


      selection_bg = {
        color_light = pink-xxxlight;
        color_dark  = pink-xxxlight;
      };
      selection_fg = {
        color_light = default_fg.color_light;
        color_dark  = default_bg.color_dark;
      };


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
        color_light = pink-xxlight;
        color_dark  = pink-xxxlight;
      };
      variables = default_fg;
    };

    ############################################################################
    # Material 3 palette (e.g. for Noctalia palette)
    # (use these on things which very clearly have a Material 3 role!)
    # (although treat the terminal ANSI colors more like fixed color variables)

    material3-palette = {
      light = rec {
        mSurface          = color-roles.default_bg.color_light; # main background color
        mOnSurface        = color-roles.default_fg.color_light; # main foreground color
        mSurfaceVariant   = color-vars.white;                   # secondary background color (cards, panels)
        mOnSurfaceVariant = color-vars.gray-light;              # secondary foreground color
        mPrimary          = color-vars.pink-xxlight;            # primary accent (buttons, links, highlights)
        mOnPrimary        = color-vars.black;                   # text on primary surfaces
        mSecondary        = color-vars.blue;                    # secondary accent
        mOnSeconary       = mOnPrimary;                         # text on secondary surfaces
        mTertiary         = color-vars.orange;                  # tertiary accent
        mOnTertiary       = mOnPrimary;                         # text on tertiary surfaces
        mError            = color-vars.red;                     # error color
        mOnError          = color-vars.black;                   # text on error surfaces
        mOutline          = color-vars.pink-xxlight;            # borders and dividers
        mShadow           = mSurface;                           # shadows
        mHover            = mTertiary;                          # hover state background
        mOnHover          = mOnTertiary;                        # text on hover surfaces

        terminal = rec {
          background  = mSurface;
          foreground  = mOnSurface;
          cursor      = color-vars.pink-xxlight;
          cursorText  = foreground;
          selectionBg = color-roles.selection_bg.color_light;
          selectionFg = color-roles.selection_fg.color_light;
          normal = {
            black   = color-vars.black;
            red     = color-vars.pink;
            green   = color-vars.green-deep-dark;
            yellow  = color-vars.orange-deep;
            blue    = color-vars.blue-xdeep-light;
            magenta = color-vars.pink-light;
            cyan    = color-vars.blue-deep;
            white   = color-vars.gray-xlight;
          };
          bright = {
            black   = color-vars.gray-xdark;
            red     = color-vars.red;
            green   = color-vars.green-deep-xdark;
            yellow  = color-vars.orange-xdeep;
            blue    = color-vars.blue-xdeep;
            magenta = color-vars.pink-xlight;
            cyan    = color-vars.blue-deep-dark;
            white   = color-vars.white;
          };
        };
      };

      dark = rec {
        mSurface          = color-roles.default_bg.color_dark;
        mOnSurface        = color-roles.default_fg.color_dark;
        mSurfaceVariant   = color-vars.gray-xdark;
        mOnSurfaceVariant = color-vars.gray-light;
        mPrimary          = color-vars.pink-xxlight;
        mOnPrimary        = color-vars.black;
        mSecondary        = color-vars.blue-light;
        mOnSeconary       = mOnPrimary;
        mTertiary         = color-vars.orange;
        mOnTertiary       = mOnPrimary;
        mError            = color-vars.red;
        mOnError          = color-vars.black;
        mOutline          = color-vars.pink-xxxlight;
        mShadow           = mSurface;
        mHover            = mTertiary;
        mOnHover          = mOnTertiary;

        terminal = rec {
          background  = mSurface;
          foreground  = mOnSurface;
          cursor      = color-vars.pink-xxxlight;
          cursorText  = background;
          selectionBg = color-roles.selection_bg.color_dark;
          selectionFg = color-roles.selection_fg.color_dark;
          normal = {
            black   = color-vars.black;
            red     = color-vars.pink-xlight;
            green   = color-vars.green;
            yellow  = color-vars.orange;
            blue    = color-vars.blue-xdeep;
            magenta = color-vars.pink-xxlight;
            cyan    = color-vars.blue;
            white   = color-vars.gray-xlight;
          };
          bright = {
            black   = color-vars.gray-xdark;
            red     = color-vars.red;
            green   = color-vars.green-light;
            yellow  = color-vars.orange-light;
            blue    = color-vars.blue-xdeep-light;
            magenta = color-vars.pink-xxxlight;
            cyan    = color-vars.blue-light;
            white   = color-vars.white;
          };
        };
      };
    };
  };
}
