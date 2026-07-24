{
  flake.modules.nixos.code-counters = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.tokei
    ];
  };
}
