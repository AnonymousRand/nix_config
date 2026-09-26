{ den, ... }: {
  # (this *does* work with homes, presumably since there is no cross-entity stuff happening here)
  den.schema.home.includes = [ den.aspects.user-host.base ];

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
