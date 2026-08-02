let
  capabilities = {
    networking = {
      supported = true;
    };
  };
in
{
  den.hosts.x86_64-linux.snow-rainbow = {
    core = { inherit capabilities; };
  };

  den.homes.x86_64-linux = {
    "meow@rainbow" = {
      core = { inherit capabilities; };
    };
  };
}
