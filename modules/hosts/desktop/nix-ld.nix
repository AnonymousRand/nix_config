{
  den.hosts.x86_64-linux.desktop = {
    settings.utils.nix-ld = {
      libs = { pkgs }: [
        pkgs.uv
      ];
    };
  };
}
