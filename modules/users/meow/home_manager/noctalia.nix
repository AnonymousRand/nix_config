{ inputs, ... }: {
  flake.homeModules.meow = { config, ... }: {
    imports = [
      inputs.noctalia.homeModules.default
    ];

    programs.noctalia = {
      enable = true;
      settings = {
        theme = {
          # declare my custom color palette for Noctalia app theming
          source = "custom";
          custom_palette = "anonymousrand";

          templates = {
            # enable built-in app theming, which uses templates to map
            # Noctalia color palette colors to each app's configs
            enable_builtin_templates = true;

            custom_colors = {
              bonus = {
                color = "#ffa200";
                blend = false;
              };
            };
          };
        };
      };
    };

    xdg.configFile."noctalia/palettes/anonymousrand.json".text = with config.meow; builtins.toJSON {
      dark = rec {
        mPrimary          = colors.pink-light;
        mOnPrimary        = colors.black;
        mSecondary        = colors.orange-light;
        mOnSeconary       = mOnPrimary;
        mTertiary         = colors.blue-light;
        mOnTertiary       = mOnPrimary;
        mError            = colors.red;
        mOnError          = colors.black;
        mSurface          = colors.black;
        mOnSurface        = colors.white-dark;
        mSurfaceVariant   = "#202020";
        mOnSurfaceVariant = mOnSurface;
        mOutline          = colors.pink-xlight;
        mShadow           = mSurface;
        mHover            = mTertiary;
        mOnHover          = mOnTertiary;
        terminal = rec {
          background  = mSurface;
          foreground  = mOnSurface;
          cursor      = colors.pink-xlight;
          cursorText  = background;
          selectionBg = colors.pink-xlight;
          selectionFg = background;
          normal = {
            black   = colors.black;
            red     = colors.orange-xdeep;
            green   = colors.green;
            yellow  = colors.orange;
            blue    = colors.blue-deep;
            magenta = colors.pink;
            cyan    = colors.blue;
            white   = colors.white-dark;
          };
          bright = {
            black   = colors.black-light;
            red     = colors.red;
            green   = colors.green-light;
            yellow  = colors.orange-light;
            blue    = colors.blue-deep-light;
            magenta = colors.pink-light;
            cyan    = colors.blue-light;
            white   = colors.white;
          };
        };
      };
    };
  };
}
