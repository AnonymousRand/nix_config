{
  den.aspects.profiles.meow = {
    homeManager = { profile, ... }: {
      aspects.batteries.noctalia-theming =
        let
          colors = profile.settings.theme.colors;
        in
        {
          # set base values for `noctalia-theming`'s options
          customColors = colors.vars // colors.themed;

          # Material 3 palette for noctalia
          # (try not to use these directly in templates; i am maybe starting to move fully
          # towards custom colors instead of m3, and keeping m3 only for noctalia to be happy)
          palette = with colors; {
            light = rec {
              mSurface          = themed.default_bg.color_light;     # main background color
              mOnSurface        = themed.default_fg.color_light;     # main foreground color
              mSurfaceVariant   = themed.variant_1_bg.color_light;   # variant background color (cards, panels)
              mOnSurfaceVariant = themed.variant_1_fg.color_light;   # variant foreground color
              mPrimary          = themed.accent_2_bg;                # primary accent (buttons, links, highlights)
              mOnPrimary        = themed.accent_2_fg;                # text on primary surfaces
              mSecondary        = themed.accent_3_bg;                # secondary accent
              mOnSecondary      = themed.accent_3_fg;                # text on secondary surfaces
              mTertiary         = themed.accent_4_bg;                # tertiary accent
              mOnTertiary       = themed.accent_4_fg;                # text on tertiary surfaces
              mOutline          = themed.border_default.color_light; # borders and dividers
              mShadow           = vars.gray_xdark;                   # shadows
              mHover            = themed.hover_bg.color_light;       # hover state background
              mOnHover          = themed.hover_fg.color_light;       # text on hover surfaces
              mError            = themed.error_bg.color_light;       # error color
              mOnError          = themed.error_fg.color_light;       # text on error surfaces

              terminal = rec {
                background  = mSurface;
                foreground  = mOnSurface;
                cursor      = themed.cursor_bg.color_light;
                cursorText  = themed.cursor_fg.color_light;
                selectionBg = themed.selection_bg.color_light;
                selectionFg = themed.selection_fg.color_light;
                normal = {
                  black   = vars.black;
                  red     = vars.pink_xxlight;
                  green   = vars.green_deep_xdark;
                  yellow  = vars.orange_xdeep;
                  blue    = vars.blue_xdeep_light;
                  magenta = vars.pink_xxlight;
                  cyan    = vars.blue_deep;
                  white   = vars.gray_xxlight;
                };
                bright = {
                  black   = vars.gray_xdark;
                  red     = vars.red;
                  green   = vars.green_deep_dark;
                  yellow  = vars.orange_deep;
                  blue    = vars.blue_xdeep_xlight;
                  magenta = vars.pink_xxxlight;
                  cyan    = vars.blue;
                  white   = vars.white;
                };
              };
            };

            dark = rec {
              mSurface          = themed.default_bg.color_dark;
              mOnSurface        = themed.default_fg.color_dark;
              mSurfaceVariant   = themed.variant_1_bg.color_dark;
              mOnSurfaceVariant = themed.variant_1_fg.color_dark;
              mPrimary          = themed.accent_2_bg;
              mOnPrimary        = themed.accent_2_fg;
              mSecondary        = themed.accent_3_bg;
              mOnSecondary      = themed.accent_3_fg;
              mTertiary         = themed.accent_4_bg;
              mOnTertiary       = themed.accent_4_fg;
              mOutline          = themed.border_default.color_dark;
              mShadow           = vars.gray_xdark;
              mHover            = themed.hover_bg.color_dark;
              mOnHover          = themed.hover_fg.color_dark;
              mError            = themed.error_bg.color_dark;
              mOnError          = themed.error_fg.color_dark;

              terminal = rec {
                background  = mSurface;
                foreground  = mOnSurface;
                cursor      = themed.cursor_bg.color_dark;
                cursorText  = themed.cursor_fg.color_dark;
                selectionBg = themed.selection_bg.color_dark;
                selectionFg = themed.selection_fg.color_dark;
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
                  green   = vars.green_deep_light;
                  yellow  = vars.orange_light;
                  blue    = vars.blue_xdeep_light;
                  magenta = vars.pink_xxxlight;
                  cyan    = vars.blue_light;
                  white   = vars.white;
                };
              };
            };
          };
        };
    };
  };
}
