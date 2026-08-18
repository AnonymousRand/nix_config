{ den, meow, ... }:
let
  aspectName = "noctalia-theming";
in
{
  meow.utils.theme.${aspectName} = {
    includes = [
      den.aspects.utils.theme.${aspectName}

      ({ usrSettings }: {
        homeManager = {
          utils.theme.${aspectName} =
            let
              colors = usrSettings.theme.colors;
            in
            {
              # set base values for `noctalia-theming`'s options
              customColors = colors.vars // colors.roles;

              # Material 3 palette for noctalia
              # (try not to use these directly in templates; i am maybe starting to move fully
              # towards custom colors instead of m3, and keeping m3 only for noctalia to be happy)
              palette = {
                light = rec {
                  mSurface          = colors.roles.default_bg.color_light;      # main background color
                  mOnSurface        = colors.roles.default_fg.color_light;      # main foreground color
                  mSurfaceVariant   = colors.roles.variant_bg.color_light;      # variant background color (cards, panels)
                  mOnSurfaceVariant = colors.roles.variant_fg.color_light;      # variant foreground color
                  mPrimary          = colors.roles.accent_2_bg;                 # primary accent (buttons, links, highlights)
                  mOnPrimary        = colors.roles.accent_2_fg;                 # text on primary surfaces
                  mSecondary        = colors.roles.accent_3_bg;                 # secondary accent
                  mOnSecondary      = colors.roles.accent_3_fg;                 # text on secondary surfaces
                  mTertiary         = colors.roles.accent_4_bg;                 # tertiary accent
                  mOnTertiary       = colors.roles.accent_4_fg;                 # text on tertiary surfaces
                  mOutline          = colors.roles.outline_default.color_light; # borders and dividers
                  mShadow           = colors.vars.gray_xdark;                   # shadows
                  mHover            = colors.roles.hover_bg.color_light;        # hover state background
                  mOnHover          = colors.roles.hover_fg.color_light;        # text on hover surfaces
                  mError            = colors.roles.error_bg.color_light;        # error color
                  mOnError          = colors.roles.error_fg.color_light;        # text on error surfaces

                  terminal = rec {
                    background  = mSurface;
                    foreground  = mOnSurface;
                    cursor      = colors.roles.cursor_bg.color_light;
                    cursorText  = colors.roles.cursor_fg.color_light;
                    selectionBg = colors.roles.selection_bg.color_light;
                    selectionFg = colors.roles.selection_fg.color_light;
                    normal = {
                      black   = colors.vars.black;
                      red     = colors.vars.pink_xxlight;
                      green   = colors.vars.green_deep_xdark;
                      yellow  = colors.vars.orange_xdeep;
                      blue    = colors.vars.blue_xdeep_light;
                      magenta = colors.vars.pink_xxlight;
                      cyan    = colors.vars.blue_deep;
                      white   = colors.vars.gray_xxlight;
                    };
                    bright = {
                      black   = colors.vars.gray_xdark;
                      red     = colors.vars.red;
                      green   = colors.vars.green_deep_dark;
                      yellow  = colors.vars.orange_deep;
                      blue    = colors.vars.blue_xdeep_xlight;
                      magenta = colors.vars.pink_xxxlight;
                      cyan    = colors.vars.blue;
                      white   = colors.vars.white;
                    };
                  };
                };

                dark = rec {
                  mSurface          = colors.roles.default_bg.color_dark;
                  mOnSurface        = colors.roles.default_fg.color_dark;
                  mSurfaceVariant   = colors.roles.variant_bg.color_dark;
                  mOnSurfaceVariant = colors.roles.variant_fg.color_dark;
                  mPrimary          = colors.roles.accent_2_bg;
                  mOnPrimary        = colors.roles.accent_2_fg;
                  mSecondary        = colors.roles.accent_3_bg;
                  mOnSecondary      = colors.roles.accent_3_fg;
                  mTertiary         = colors.roles.accent_4_bg;
                  mOnTertiary       = colors.roles.accent_4_fg;
                  mOutline          = colors.roles.outline_default.color_dark;
                  mShadow           = colors.vars.gray_xdark;
                  mHover            = colors.roles.hover_bg.color_dark;
                  mOnHover          = colors.roles.hover_fg.color_dark;
                  mError            = colors.roles.error_bg.color_dark;
                  mOnError          = colors.roles.error_fg.color_dark;

                  terminal = rec {
                    background  = mSurface;
                    foreground  = mOnSurface;
                    cursor      = colors.roles.cursor_bg.color_dark;
                    cursorText  = colors.roles.cursor_fg.color_dark;
                    selectionBg = colors.roles.selection_bg.color_dark;
                    selectionFg = colors.roles.selection_fg.color_dark;
                    normal = {
                      black   = colors.vars.black;
                      red     = colors.vars.pink_xxxlight;
                      green   = colors.vars.green;
                      yellow  = colors.vars.orange;
                      blue    = colors.vars.blue_xdeep;
                      magenta = colors.vars.pink_xxxlight;
                      cyan    = colors.vars.blue;
                      white   = colors.vars.gray_xxlight;
                    };
                    bright = {
                      black   = colors.vars.gray_xdark;
                      red     = colors.vars.red;
                      green   = colors.vars.green_light;
                      yellow  = colors.vars.orange_light;
                      blue    = colors.vars.blue_xdeep_light;
                      magenta = colors.vars.pink_xxxlight;
                      cyan    = colors.vars.blue_light;
                      white   = colors.vars.white;
                    };
                  };
                };
              };
            };
        };
      })
    ];
  };
}
