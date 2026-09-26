{
  den.aspects.users.meow = {
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
