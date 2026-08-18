let
  # TODO try systSettings.capabilities here instead if works with user settings
  capabilities = {
    bluetooth = {
      supported = true;
    };
  };
in
{
  den.hosts.x86_64-linux.snow-rainbow = {
    systSettings = { inherit capabilities; };
  };

  den.homes.x86_64-linux = {
    "meow@snow-rainbow" = {
      systSettings = { inherit capabilities; };
    };
  };
}
