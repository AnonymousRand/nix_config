let
  fontName = "Quicksand Medium";

  usrSettings.theme.fonts.list.${fontName} = {
    size = {
      normal = 12;
      gtk = 12.1;
    };
    weight = {
      # commented out since the fontconfig weights are bwoken for Quicksand 3:
      #opentype = 500;
    };
  };
in
{
  den.hosts.x86_64-linux.snow-rainbow.users.meow = { inherit usrSettings; };

  den.homes.x86_64-linux."meow@rainbow" = { inherit usrSettings; };
}
