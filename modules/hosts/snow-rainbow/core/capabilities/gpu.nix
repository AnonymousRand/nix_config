let
  capabilities = {
    gpu = {
      supported = true;
      vendor = "nvidia";
    };
  };
in
{
  den.hosts.x86_64-linux.snow-rainbow = {
    core = { inherit capabilities; };
  };

  den.homes.x86_64-linux = {
    "meow@snow-rainbow" = {
      core = { inherit capabilities; };
    };
  };
}
