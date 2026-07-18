rec {
  ############################################################################
  # basic color variables
  # (avoid using these directly in templates as much as possible)

  vars = {
    black            = "#000000";
    gray_xxdark      = "#242424";
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
    blue_xxdeep      = "#00a6ff";

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

    pink             = "#ff409f";
    pink_light       = "#ff73b9";
    pink_xlight      = "#ff8fc7";
    pink_xxlight     = "#ffadd6";
    pink_xxxlight    = "#ffcbe6";
    pink_xxxxlight   = "#ffdeee";
    pink_xxxxxlight  = "#ffe8f4";

    red              = "#ff0000";
  };

  ############################################################################
  # custom color roles/variables (currently in format for Noctalia custom colors)
  # (use these on things which very clearly have any of the following roles)

  roles = with vars; rec {
    default_fg = {
      color_light = gray_dark;
      color_dark  = gray_xxlight;
    };
    default_bg = {
      color_light = "#feedf3";
      color_dark  = black;
    };
    lighter_fg = {
      color_light = gray_xlight;
      color_dark  = gray;
    };

    variant_fg = {
      color_light = pink_xlight;
      color_dark  = pink_xlight;
    };
    variant_bg = {
      color_light = "#fff7fa";
      color_dark  = gray_xxdark;
    };

    selection_fg = {
      color_light = pink_light;
      color_dark  = pink;
    };
    selection_bg = {
      color_light = pink_xxxxlight;
      color_dark  = pink_xxxlight;
    };

    hover_fg = {
      color_light = pink_light;
      color_dark  = pink;
    };
    hover_bg = {
      color_light = pink_xxxxlight;
      color_dark  = pink_xxlight;
    };
    hover_variant_fg = {
      color_light = pink_xlight;
      color_dark  = pink;
    };
    hover_variant_bg = {
      color_light = pink_xxxxxlight;
      color_dark  = pink_xxxlight;
    };

    outline = {
      color_light = pink_xxlight;
      color_dark  = pink_xxlight;
    };
    outline_strong = {
      color_light = pink_light;
      color_dark  = pink_light;
    };

    search_fg = selection_fg;
    search_bg = selection_bg;
    search_curr_fg = {
      color_light = default_fg.color_light;
      color_dark  = default_bg.color_dark;
    };
    search_curr_bg = {
      color_light = green_light;
      color_dark  = green_light;
    };

    error = {
      color_light = red;
      color_dark  = red;
    };
    error_fg = {
      color_light = "#d90000";
      color_dark  = "#cc0000";
    };
    error_bg = {
      color_light = "#ffe0e0";
      color_dark  = "#ffe0e0";
    };
    warning = {
      color_light = orange_xxdeep;
      color_dark  = orange_deep;
    };
    warning_fg = {
      color_light = "#bf6900";
      color_dark  = "#b36200";
    };
    warning_bg = {
      color_light = "#fff3d6";
      color_dark  = "#fff3d6";
    };
    success = {
      color_light = green_deep_xdark;
      color_dark  = green;
    };
    success_fg = {
      color_light = "#4d8c00";
      color_dark  = "#468000";
    };
    success_bg = {
      color_light = "#f3ffe3";
      color_dark  = "#f3ffe3";
    };

    link = {
      color_light = blue_xdeep;
      color_dark  = blue;
    };
    link_hovered = {
      color_light = blue_xxdeep;
      color_dark  = blue_light;
    };

    class = {
      color_light = orange_xdeep;
      color_dark  = orange;
    };
    comment = {
      color_light = green_deep_xdark;
      color_dark  = green_light;
    };
    constant = {
      color_light = blue_deep;
      color_dark  = blue_light;
    };
    function = {
      color_light = orange_xdeep;
      color_dark  = orange;
    };
    keyword = {
      color_light = pink_xlight;
      color_dark  = pink_xxxlight;
    };
    variable = default_fg;
  };

  ############################################################################
  # Material 3 palette (e.g. for Noctalia palette)
  # (use these on things which very clearly have a Material 3 role, and Noctalia didn't change the color)
  # (although treat the terminal ANSI colors more like fixed color variables)

  m3Palette = {
    light = rec {
      mSurface          = roles.default_bg.color_light; # main background color
      mOnSurface        = roles.default_fg.color_light; # main foreground color
      mSurfaceVariant   = roles.variant_bg.color_light; # variant background color (cards, panels)
      mOnSurfaceVariant = roles.variant_fg.color_light; # variant foreground color
      mPrimary          = vars.pink_xxxlight;           # primary accent (buttons, links, highlights)
      mOnPrimary        = vars.pink;                    # text on primary surfaces
      mSecondary        = vars.pink_xxxxlight;          # secondary accent
      mOnSecondary      = vars.pink_light;              # text on secondary surfaces
      mTertiary         = vars.pink_xxxxxlight;         # tertiary accent
      mOnTertiary       = vars.pink_xlight;             # text on tertiary surfaces
      mOutline          = roles.outline.color_light;    # borders and dividers
      mShadow           = vars.gray_xdark;              # shadows
      mHover            = roles.hover_bg.color_light;   # hover state background
      mOnHover          = roles.hover_fg.color_light;   # text on hover surfaces
      mError            = roles.error_bg.color_light;   # error color
      mOnError          = roles.error_fg.color_light;   # text on error surfaces

      terminal = rec {
        background  = mSurface;
        foreground  = mOnSurface;
        cursor      = vars.pink_xxxlight;
        cursorText  = foreground;
        selectionBg = roles.selection_bg.color_light;
        selectionFg = roles.selection_fg.color_light;
        normal = {
          black   = vars.black;
          red     = vars.pink_xlight;
          green   = vars.green_deep_dark;
          yellow  = vars.orange_xdeep;
          blue    = vars.blue_xdeep_light;
          magenta = vars.pink_xlight;
          cyan    = vars.blue_deep;
          white   = vars.gray_xxlight;
        };
        bright = {
          black   = vars.gray_xdark;
          red     = vars.red;
          green   = vars.green_deep_xdark;
          yellow  = vars.orange_xdeep;
          blue    = vars.blue_xdeep;
          magenta = vars.pink_xlight;
          cyan    = vars.blue_deep;
          white   = vars.white;
        };
      };
    };

    dark = rec {
      mSurface          = roles.default_bg.color_dark;
      mOnSurface        = roles.default_fg.color_dark;
      mSurfaceVariant   = roles.variant_bg.color_dark;
      mOnSurfaceVariant = roles.variant_fg.color_dark;
      mPrimary          = vars.pink_xlight;
      mOnPrimary        = vars.gray_xxdark;
      mSecondary        = vars.pink_xxlight;
      mOnSecondary      = vars.pink;
      mTertiary         = vars.pink_xxxlight;
      mOnTertiary       = vars.pink;
      mOutline          = roles.outline.color_dark;
      mShadow           = vars.gray_xdark;
      mHover            = roles.hover_bg.color_dark;
      mOnHover          = roles.hover_fg.color_dark;
      mError            = roles.error_bg.color_dark;
      mOnError          = roles.error_fg.color_dark;

      terminal = rec {
        background  = mSurface;
        foreground  = mOnSurface;
        cursor      = vars.pink_xxxlight;
        cursorText  = background;
        selectionBg = roles.selection_bg.color_dark;
        selectionFg = roles.selection_fg.color_dark;
        normal = {
          black   = vars.black;
          red     = vars.pink_xxlight;
          green   = vars.green;
          yellow  = vars.orange;
          blue    = vars.blue_xdeep;
          magenta = vars.pink_xxlight;
          cyan    = vars.blue;
          white   = vars.gray_xxlight;
        };
        bright = {
          black   = vars.gray_xdark;
          red     = vars.red;
          green   = vars.green_light;
          yellow  = vars.orange_light;
          blue    = vars.blue_xdeep_light;
          magenta = vars.pink_xxxlight;
          cyan    = vars.blue_light;
          white   = vars.white;
        };
      };
    };
  };
}
