{
  den.schema.host.includes = [
    {
      nixos = { host, ... }: {
        system.stateVersion = host.stateVersion;
      };

      homeManager = { host, ... }: {
        home.stateVersion = host.stateVersion;
      };
    };
  ];
}
