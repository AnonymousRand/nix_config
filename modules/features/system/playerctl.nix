{
  den.aspects.system.playerctl = {
    # TODO: may need `services.playerctld.enable`
    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.playerctl
      ];
    };
  };
}
