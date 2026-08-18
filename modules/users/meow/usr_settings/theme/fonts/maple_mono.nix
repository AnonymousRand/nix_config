let
  fontName = "Maple Mono NF";

  usrSettings.theme.fonts.list.${fontName} = {
    size = {
      normal = 12;
    };
    enabledFontFeatures = [
      # keep normal commas and semicolons
      "cv61"
    ];
    disabledFontFeatures = [
      # disable programming ligatures
      "calt"
    ];
  };
in
{
  den.hosts.x86_64-linux.snow-rainbow.users.meow = { inherit usrSettings; };

  den.homes.x86_64-linux."meow@rainbow" = { inherit usrSettings; };
}
