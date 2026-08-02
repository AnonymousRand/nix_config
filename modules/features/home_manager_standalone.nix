{
  den.aspects.features.home-manager-standalone = {
    homeManager = { pkgs, ... }: {
      # enables standalone `home-manager` command (note: this won't be accessible if this config is
      # built with `nixos-rebuild`; only when you bootstrap using manual home manager system to build
      # the home manager config for the first time (so it's mainly for non-nixos systems). i think.)
      programs.home-manager.enable = true;

      # enables standalone `home-manager` command when config *is* built is `nixos-rebuild`
      home.packages = [
        pkgs.home-manager
      ];
    };
  };
}
