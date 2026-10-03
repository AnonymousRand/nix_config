{ den, ... }: {
  den.aspects.hosts.base = {
    includes = [
      # sets `nixos.networking.hostName` from `host.hostName` in host entity
      den.batteries.hostname

      den.aspects.host-settings.admin-users
      den.aspects.host-settings.hm-use-global-pkgs
      den.aspects.host-settings.printing
    ];
  };
}
