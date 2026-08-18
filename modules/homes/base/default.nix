{ den, ... }: {
  # (this *does* work with homes, presumably since there is no cross-entity stuff happening here)
  den.schema.home.includes = [ den.aspects.homes.base ];

  den.aspects.homes.base = {
    includes = [
      # activate the "batteries" associated with these settings
      den.aspects.syst-settings.capabilities
      den.aspects.syst-settings.state-version

      # activate these utils
      den.aspects.utils.overlays
    ];
  };
}
