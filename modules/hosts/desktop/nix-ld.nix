{ den, ... }: {
  den.aspects.hosts.base = {
    # enable `nix-ld` (note that putting such includes in host schema does not work 3:)
    includes = [
      den.aspects.utils.nix-ld
    ];
  };

  den.hosts.x86_64-linux.desktop = {
    settings.utils.nix-ld = {
      libs = { pkgs }: [
        pkgs.uv
      ];
    };
  };
}
