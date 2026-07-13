rec {
  ############################################################################
  # basic color variables
  # (avoid using these directly in templates as much as possible)

  vars = {
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


    selection_fg = {
      color_light = default_fg.color_light;
      color_dark  = default_bg.color_dark;
    };
    selection_bg = {
      color_light = pink_xxxlight;
      color_dark  = pink_xxlight;
    };


    search_fg      = selection_fg;
    search_bg      = selection_bg;
    search_curr_fg = search_fg;
    search_curr_bg = {
      color_light = green_light;
      color_dark  = green_light;
    };


    error   = {
      color_light = red;
      color_dark  = red;
    };
    warning = {
      color_light = orange_xxdeep;
      color_dark  = orange_deep;
    };


    link         = {
      color_light = blue_xdeep;
      color_dark  = blue;
    };
    link_hover   = {
      color_light = blue_xxdeep;
      color_dark  = blue_light;
    };


    class    = {
      color_light = orange_xdeep;
      color_dark  = orange;
    };
    comment  = {
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
    keyword  = {
      color_light = pink_light;
      color_dark  = pink_xxlight;
    };
    variable = default_fg;
  };

  ############################################################################
  # Material 3 palette (e.g. for Noctalia palette)
  # (use these on things which very clearly have a Material 3 role, and Noctalia didn't change the color)
  # (although treat the terminal ANSI colors more like fixed color variables)

  m3-palette = {
    light = rec {
      mSurface          = roles.default_bg.color_light; # main background color
      mOnSurface        = roles.default_fg.color_light; # main foreground color
      mSurfaceVariant   = "#fffafc";                    # variant background color (cards, panels)
      mOnSurfaceVariant = vars.gray;                    # variant foreground color
      mPrimary          = vars.pink_light;              # primary accent (buttons, links, highlights)
      mOnPrimary        = vars.gray_xxdark;             # text on primary surfaces
      mSecondary        = vars.pink_xxlight;            # secondary accent
      mOnSecondary      = vars.gray_xdark;              # text on secondary surfaces
      mTertiary         = vars.pink_xxxlight;           # tertiary accent
      mOnTertiary       = vars.gray_dark;               # text on tertiary surfaces
      mOutline          = vars.pink_xlight;             # borders and dividers
      mShadow           = vars.gray_xdark;              # shadows
      mHover            = mSecondary;                   # hover state background
      mOnHover          = mOnSecondary;                 # text on hover surfaces
      mError            = roles.error.color_light;      # error color
      mOnError          = vars.white;                   # text on error surfaces

      terminal = rec {
        background  = mSurface;
        foreground  = mOnSurface;
        cursor      = vars.pink_xxlight;
        cursorText  = foreground;
        selectionBg = roles.selection_bg.color_light;
        selectionFg = roles.selection_fg.color_light;
        normal = {
          black   = vars.black;
          red     = vars.pink_light;
          green   = vars.green_deep_dark;
          yellow  = vars.orange_xdeep;
          blue    = vars.blue_xdeep_light;
          magenta = vars.pink_light;
          cyan    = vars.blue_deep;
          white   = vars.gray_xxlight;
        };
        bright = {
          black   = vars.gray_xdark;
          red     = vars.red;
          green   = vars.green_deep_xdark;
          yellow  = vars.orange_xdeep;
          blue    = vars.blue_xdeep;
          magenta = vars.pink_light;
          cyan    = vars.blue_deep;
          white   = vars.white;
        };
      };
    };

    dark = rec {
      mSurface          = roles.default_bg.color_dark;
      mOnSurface        = roles.default_fg.color_dark;
      mSurfaceVariant   = vars.gray_xxdark;
      mOnSurfaceVariant = vars.gray_xlight;
      mPrimary          = vars.pink_light;
      mOnPrimary        = vars.gray_xxdark;
      mSecondary        = vars.pink_xlight;
      mOnSecondary      = vars.gray_xxdark;
      mTertiary         = vars.pink_xxlight;
      mOnTertiary       = vars.gray_xdark;
      mOutline          = vars.pink_xlight;
      mShadow           = vars.gray_xdark;
      mHover            = mSecondary;
      mOnHover          = mOnSecondary;
      mError            = roles.error.color_dark;
      mOnError          = vars.white;

      terminal = rec {
        background  = mSurface;
        foreground  = mOnSurface;
        cursor      = vars.pink_xxlight;
        cursorText  = background;
        selectionBg = roles.selection_bg.color_dark;
        selectionFg = roles.selection_fg.color_dark;
        normal = {
          black   = vars.black;
          red     = vars.pink_xlight;
          green   = vars.green;
          yellow  = vars.orange;
          blue    = vars.blue_xdeep;
          magenta = vars.pink_xlight;
          cyan    = vars.blue;
          white   = vars.gray_xxlight;
        };
        bright = {
          black   = vars.gray_xdark;
          red     = vars.red;
          green   = vars.green_light;
          yellow  = vars.orange_light;
          blue    = vars.blue_xdeep_light;
          magenta = vars.pink_xxlight;
          cyan    = vars.blue_light;
          white   = vars.white;
        };
      };
    };
  };
}
