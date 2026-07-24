{ ... }: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "Host *" = {
        # send null packets periodically to keep sessions alive
        ServerAliveInterval = 60;
      };
    };
  };
}
