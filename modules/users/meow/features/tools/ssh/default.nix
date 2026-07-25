{ den, ... }: {
  meow.features.tools.ssh-client = {
    includes = [
      den.aspects.features.tools.ssh-client
    ];

    homeManager = {
      programs.ssh = {
        enableDefaultConfig = false;
        settings = {
          "Host *" = {
            # send null packets periodically to keep sessions alive
            ServerAliveInterval = 60;
          };
        };
      };
    };
  };
}
