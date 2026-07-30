{ den, ... }: {
  den.aspects.hosts.base = {
    includes = [
      den.aspects.utils.quirks.nix-ld
    ];
  };
}
