{
  den.aspects.features.tools.bitwarden-cli = {
    # this needs to be installed in `nixos` for noctalia bitwarden plugin
    # (probably `bw serve` needs root to open a port?)
    nixos = { pkgs, ... }: {
      environment.systemPackages = [
        pkgs.bitwarden-cli
      ];
    };
  };
}
