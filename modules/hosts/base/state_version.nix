{
  den.aspects.hosts.base = {
    nixos = { host, ... }: {
      system.stateVersion = host.stateVersion;
    };

    homeManager = { host, ... }: {
      home.stateVersion = host.stateVersion;
    };
  };
}
