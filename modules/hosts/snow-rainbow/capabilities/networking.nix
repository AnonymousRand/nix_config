let
  capabilities = {
    networking = {
      supported = true;
    };
  };
in
{
  den.hosts.x86_64-linux.snow-rainbow = {
    inherit capabilities;
  };

  den.homes.x86_64-linux = {
    "meow@rainbow" = {
      inherit capabilities;
    };
  };
}
