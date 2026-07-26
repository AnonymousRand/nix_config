{ den, ... }: {
  den.aspects.hosts.desktop = {
    # enable `nix-ld` (note that putting such includes in host schema does not work 3:)
    includes = [
      den.aspects.utils.nix-ld
    ];

    # set values for `nix-ld`'s options
    den.aspects.utils.nix-ld.libs = { pkgs }: [
      pkgs.uv
    ];
  };
}
