{
  den.aspects.features.tools.glib = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = [
        pkgs.glib
      ];
    };
  };
}
