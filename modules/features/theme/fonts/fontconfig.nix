{
  den.aspects.features.theme.fonts.fontconfig = { userSettings }: {
    homeManager = { lib, ... }:
      let
        fontSettings = userSettings.theme.fonts;
      in
      {
        fonts.fontconfig = {
          enable = true;
          antialiasing = true;
          hinting = "slight";
          defaultFonts = {
            serif = fontSettings.defaults.serif or [];
            sansSerif = fontSettings.defaults.sansSerif or [];
            monospace = fontSettings.defaults.monospace or [];
          };

          # automatically generate fontconfig files for each font based on the settings
          # in `userSettings`
          configFile = builtins.mapAttrs (name: value:
            {
              enable = true;
              label = name;
              priority = 90;
              text =
                let
                  enabledFontFeaturesStr = builtins.foldl'
                    (acc: elem: acc + "<string>${elem} on</string>\n")
                    "" value.enabledFontFeatures;

                  disabledFontFeaturesStr = builtins.foldl'
                    (acc: elem: acc + "<string>${elem} off</string>\n")
                    "" value.disabledFontFeatures;
                in
                ''
                  <?xml version="1.0"?>
                  <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
                  <fontconfig>
                    <match target="font">
                      <test name="family" compare="eq">
                        <string>${name}</string>
                      </test>
                      <edit name="weight" mode="assign">
                        <int>${value.weight.fontconfig}</int>
                      </edit>
                      <edit name="fontfeatures" mode="append">
                        ${enabledFontFeaturesStr}
                        ${disabledFontFeaturesStr}
                      </edit>
                    </match>
                  </fontconfig>
                '';
            }
          ) fontSettings.list;
        };
      };
  };
}
