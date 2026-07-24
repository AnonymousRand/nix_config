{
  den.schema.host = {
    nixos = { host, ... }: {
      # set `stateVersion` for host's nixos config
      assert host ? stateVersion;
      system.stateVersion = host.stateVersion;
    };

    homeManager = { host, ... }: {
      # set `stateVersion` for all users' home manager configs
      assert host ? stateVersion;
      home.stateVersion = host.stateVersion;
    };
  };
}
