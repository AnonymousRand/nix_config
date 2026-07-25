{
  den.aspects.hosts.common = {
    nixos = { host, ... }: {
      system.stateVersion = host.stateVersion;
    };

    provides.to-users = {
      homeManager = { host, ... }: {
        home.stateVersion = host.stateVersion;
      };
    };
  };
}
