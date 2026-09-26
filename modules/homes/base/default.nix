{ den, ... }: {
  den.aspects.user-host.base = {
    includes = [
      # activate the "batteries" associated with these settings
      den.aspects.syst-settings.capabilities
      den.aspects.syst-settings.state-version

      # activate these batteries
      den.aspects.batteries.overlays
    ];
  };
}
