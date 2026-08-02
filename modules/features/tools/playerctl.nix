{
  den.aspects.features.tools.playerctl = { host ? null, home ? null }: {
    # note: if this doesn't work, try `services.playerctld.enable` and/or services.mpris-proxy.enable`
    homeManager = { pkgs, ... }:
      import ../_require_capabilities.nix { inherit host home; } [ "media" ] {
        home.packages = [
          pkgs.playerctl
        ];
      };
  };
}
