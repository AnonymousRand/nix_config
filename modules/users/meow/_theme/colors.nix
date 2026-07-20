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
    green_xlight     = "#baff66";
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
    pink_light       = "#ff409f";
    pink_xlight      = "#ff73b9";
    pink_xxlight     = "#ff8fc7";
    pink_xxxlight    = "#ffadd6";
    pink_xxxxlight   = "#ffc7e4";
    pink_xxxxxlight  = "#ffdbed";
    pink_xxxxxxlight = "#ffe3f1";

    red              = "#ff0000";
  };

  ############################################################################
  # custom color roles/variables (currently in format for Noctalia custom colors)
  # (use these on things which very clearly have any of the following roles)

  roles = with vars; rec {
    # default fg/bg
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
      color_dark  = gray_light;
    };

    # variant fg/bg
    variant_fg = {
      color_light = pink_xxlight;
      color_dark  = pink_xxlight;
    };
    variant_bg = {
      color_light = "#fff7fa";
      color_dark  = gray_xxdark;
    };

    # accents
    accent_1_fg = {
      color_light = pink;
      color_dark  = black;
    };
    accent_1_bg = {
      color_light = pink_xxxlight;
      color_dark  = pink_xlight;
    };
    accent_2_fg = {
      color_light = pink_light;
      color_dark  = gray_xxdark;
    };
    accent_2_bg = {
      color_light = pink_xxxxlight;
      color_dark  = pink_xxlight;
    };
    accent_3_fg = {
      color_light = pink_xlight;
      color_dark  = pink;
    };
    accent_3_bg = {
      color_light = pink_xxxxxlight;
      color_dark  = pink_xxxlight;
    };
    accent_4_fg = {
      color_light = pink_xxlight;
      color_dark  = pink_light;
    };
    accent_4_bg = {
      color_light = pink_xxxxxxlight;
      color_dark  = pink_xxxxlight;
    };

    # outlines
    outline_1 = {
      color_light = pink_xlight;
      color_dark  = pink_light;
    };
    outline_2 = {
      color_light = pink_xxlight;
      color_dark  = pink_xlight;
    };
    outline_3 = {
      color_light = pink_xxxlight;
      color_dark  = pink_xxlight;
    };
    outline_4 = {
      color_light = pink_xxxxlight;
      color_dark  = pink_xxxlight;
    };

    # selection
    selection_fg = {
      color_light = pink_xlight;
      color_dark  = pink_light;
    };
    selection_bg = {
      color_light = pink_xxxxxlight;
      color_dark  = pink_xxxxlight;
    };

    # cursor
    cursor_fg = {
      color_light = pink_light;
      color_dark  = pink_light;
    };
    cursor_bg = {
      color_light = pink_xxxlight;
      color_dark  = pink_xxxlight;
    };

    # hover
    hover_fg      = accent_3_fg;
    hover_bg      = accent_3_bg;
    hover_fg_vrnt = accent_4_fg;
    hover_bg_vrnt = accent_4_bg;

    # button-like elements
    btn_flat_hover_fg    = hover_fg;
    btn_flat_hover_bg    = hover_bg;
    btn_flat_border      = outline_3;
    btn_raised_base_fg   = accent_3_fg;
    btn_raised_base_bg   = accent_3_bg;
    btn_raised_border    = outline_2;
    btn_xraised_base_fg  = accent_2_fg;
    btn_xraised_base_bg  = accent_2_bg;
    btn_xraised_border   = outline_1;
    btn_selected_base_fg = btn_xraised_base_fg;
    btn_selected_base_bg = btn_xraised_base_bg;
    btn_selected_border  = btn_xraised_border;

    # button-like elements on variant surfaces
    btn_flat_hover_fg_vrnt    = hover_fg_vrnt;
    btn_flat_hover_bg_vrnt    = hover_bg_vrnt;
    btn_flat_border_vrnt      = outline_3;
    btn_raised_base_fg_vrnt   = accent_4_fg;
    btn_raised_base_bg_vrnt   = accent_4_bg;
    btn_raised_border_vrnt    = outline_2;
    btn_xraised_base_fg_vrnt  = accent_3_fg;
    btn_xraised_base_bg_vrnt  = accent_3_bg;
    btn_xraised_border_vrnt   = outline_1;
    btn_selected_base_fg_vrnt = btn_xraised_base_fg_vrnt;
    btn_selected_base_bg_vrnt = btn_xraised_base_bg_vrnt;
    btn_selected_border_vrnt  = btn_xraised_border_vrnt;

    # button-like elements on selected surfaces
    btn_flat_border_slct      = outline_2;
    btn_raised_base_fg_slct   = btn_xraised_base_fg;
    btn_raised_base_bg_slct   = btn_xraised_base_bg;
    btn_raised_border_slct    = outline_1;

    # statuses
    error = {
      color_light = red;
      color_dark  = red;
    };
    error_fg = {
      color_light = "#cc0000";
      color_dark  = "#cc0000";
    };
    error_bg = {
      color_light = "#ffcccc";
      color_dark  = "#ffcccc";
    };
    warning = {
      color_light = orange_xxdeep;
      color_dark  = orange_deep;
    };
    warning_fg = {
      color_light = "#bd6800";
      color_dark  = "#bd6800";
    };
    warning_bg = {
      color_light = "#ffeecc";
      color_dark  = "#ffeecc";
    };
    success = {
      color_light = green_deep_xdark;
      color_dark  = green;
    };
    success_fg = {
      color_light = "#4c8a00";
      color_dark  = "#4c8a00";
    };
    success_bg = {
      color_light = "#e8ffcc";
      color_dark  = "#e8ffcc";
    };

    # search
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

    # links
    link = {
      color_light = blue_xdeep;
      color_dark  = blue;
    };
    link_hovered = {
      color_light = blue_xxdeep;
      color_dark  = blue_light;
    };
    link_visited = link_hovered;

    # matching parens
    matching_paren_fg = {
      color_light = default_fg.color_light;
      color_dark  = default_bg.color_dark;
    };
    matching_paren_bg = {
      color_light = green_xlight;
      color_dark  = green_xlight;
    };

    # code syntax
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
      color_light = pink_xxlight;
      color_dark  = pink_xxxxlight;
    };
    variable = default_fg;

    # markdown syntax
    markdown_bold = {
      color_light = pink_xxlight;
      color_dark  = pink_xxlight;
    };
    markdown_italic = markdown_bold;
    markdown_code = {
      color_light = pink_light;
      color_dark  = pink_light;
    };
    markdown_title = {
      color_light = pink_light;
      color_dark  = pink_light;
    };
  };

  ############################################################################
  # Material 3 palette (e.g. for Noctalia palette)
  # (use these on things which very clearly have a Material 3 role, and Noctalia didn't change the color)
  # (although treat the terminal ANSI colors more like fixed color variables)
  #
  # note: am maybe starting to move fully towards custom colors instead of m3,
  # and keeping m3 only for noctalia to be happy?

  m3Palette = {
    light = rec {
      mSurface          = roles.default_bg.color_light; # main background color
      mOnSurface        = roles.default_fg.color_light; # main foreground color
      mSurfaceVariant   = roles.variant_bg.color_light; # variant background color (cards, panels)
      mOnSurfaceVariant = roles.variant_fg.color_light; # variant foreground color
      mPrimary          = roles.accent_2_bg;            # primary accent (buttons, links, highlights)
      mOnPrimary        = roles.accent_2_fg;            # text on primary surfaces
      mSecondary        = roles.accent_3_bg;            # secondary accent
      mOnSecondary      = roles.accent_3_fg;            # text on secondary surfaces
      mTertiary         = roles.accent_4_bg;            # tertiary accent
      mOnTertiary       = roles.accent_4_fg;            # text on tertiary surfaces
      mOutline          = roles.outline_3.color_light;  # borders and dividers
      mShadow           = vars.gray_xdark;              # shadows
      mHover            = roles.hover_bg.color_light;   # hover state background
      mOnHover          = roles.hover_fg.color_light;   # text on hover surfaces
      mError            = roles.error_bg.color_light;   # error color
      mOnError          = roles.error_fg.color_light;   # text on error surfaces

      terminal = rec {
        background  = mSurface;
        foreground  = mOnSurface;
        cursor      = roles.cursor_bg.color_light;
        cursorText  = roles.cursor_fg.color_light;
        selectionBg = roles.selection_bg.color_light;
        selectionFg = roles.selection_fg.color_light;
        normal = {
          black   = vars.black;
          red     = vars.pink_xxlight;
          green   = vars.green_deep_dark;
          yellow  = vars.orange_xdeep;
          blue    = vars.blue_xdeep_light;
          magenta = vars.pink_xxlight;
          cyan    = vars.blue_deep;
          white   = vars.gray_xxlight;
        };
        bright = {
          black   = vars.gray_xdark;
          red     = vars.red;
          green   = vars.green_deep_xdark;
          yellow  = vars.orange_xdeep;
          blue    = vars.blue_xdeep;
          magenta = vars.pink_xxlight;
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
      mPrimary          = roles.accent_2_bg;
      mOnPrimary        = roles.accent_2_fg;
      mSecondary        = roles.accent_3_bg;
      mOnSecondary      = roles.accent_3_fg;
      mTertiary         = roles.accent_4_bg;
      mOnTertiary       = roles.accent_4_fg;
      mOutline          = roles.outline_3.color_dark;
      mShadow           = vars.gray_xdark;
      mHover            = roles.hover_bg.color_dark;
      mOnHover          = roles.hover_fg.color_dark;
      mError            = roles.error_bg.color_dark;
      mOnError          = roles.error_fg.color_dark;

      terminal = rec {
        background  = mSurface;
        foreground  = mOnSurface;
        cursor      = roles.cursor_bg.color_dark;
        cursorText  = roles.cursor_fg.color_dark;
        selectionBg = roles.selection_bg.color_dark;
        selectionFg = roles.selection_fg.color_dark;
        normal = {
          black   = vars.black;
          red     = vars.pink_xxxlight;
          green   = vars.green;
          yellow  = vars.orange;
          blue    = vars.blue_xdeep;
          magenta = vars.pink_xxxlight;
          cyan    = vars.blue;
          white   = vars.gray_xxlight;
        };
        bright = {
          black   = vars.gray_xdark;
          red     = vars.red;
          green   = vars.green_light;
          yellow  = vars.orange_light;
          blue    = vars.blue_xdeep_light;
          magenta = vars.pink_xxxxlight;
          cyan    = vars.blue_light;
          white   = vars.white;
        };
      };
    };
  };
}
