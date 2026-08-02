{ den, ... }: {
  # (this *does* work with homes, presumably since there is no cross-entity stuff happening here)
  den.schema.home.includes = [ den.aspects.homes.base ];

  den.aspects.homes.base = {
    includes = [
      den.aspects.core.capabilities
      den.aspects.core.quirks.overlays
      den.aspects.core.state-version
    ];
  };
}
