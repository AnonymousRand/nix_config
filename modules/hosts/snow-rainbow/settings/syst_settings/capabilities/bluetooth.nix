let
  systSettings.capabilities.bluetooth = {
    supported = true;
  };
in
{
  den.hosts.x86_64-linux.snow-rainbow = { inherit systSettings; };

  den.homes.x86_64-linux = {
    "meow@snow-rainbow" = { inherit systSettings; };
  };
}
