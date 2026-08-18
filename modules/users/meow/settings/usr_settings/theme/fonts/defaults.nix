let
  usrSettings.theme.fonts = {
    defaults = {
      general   = [ "Quicksand Medium" ];
      serif     = [ "Quicksand Medium" ];
      sansSerif = [ "Quicksand Medium" ];
      monospace = [ "Maple Mono NF" ];
    };
  };
in
{
  den.hosts.x86_64-linux.snow-rainbow.users.meow = { inherit usrSettings; };

  den.homes.x86_64-linux."meow@rainbow" = { inherit usrSettings; };
}
