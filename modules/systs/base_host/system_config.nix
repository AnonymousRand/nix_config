{
  den.aspects.hosts.base = {
    nixos = {
      # enable nix flakes
      nix.settings.experimental-features = [ "nix-command" "flakes" ];
    };
  };
}
