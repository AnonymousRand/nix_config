{
  den.aspects.features.tools.playerctl = {
    # note: if this doesn't work, try `services.playerctld.enable`
    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.playerctl
      ];
    };
  };
}
