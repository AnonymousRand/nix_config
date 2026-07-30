{ den, ... }: {
  # note: this aspect must be manually imported in each host *aspect*, i haven't found another way
  den.aspects.hosts.base = {
    # aspects to be included in every host
    includes = [
      # sets `nixos.networking.hostName` from `host.hostName` in host entity
      den.batteries.hostname

      den.aspects.features.terminal.bash

      den.aspects.features.editors.vim

      den.aspects.features.tools.cli-utils
      den.aspects.features.tools.git
    ];
  };
}
