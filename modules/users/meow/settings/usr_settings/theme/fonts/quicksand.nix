let
  # TODO what if using just "Quicksand" and then changing font weight there?
  fontName = "Quicksand Medium";

  usrSettings.theme.fonts.list.${fontName} = {
    size = {
      normal = 12;
      gtk = 12.1;
    };
    weight = {
      # commented out since the fontconfig weights are bwoken for Quicksand 3:
      #fontconfig = 180;
    };
  };
in
{
  den.hosts.x86_64-linux.snow-rainbow.users.meow = { inherit usrSettings; };
}
