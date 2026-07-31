{
  # TODO: if this works, try moving this to a schema's includes or something
  # that prob won't work though; in that case have to manually iterate through den.aspects.hosts
  # and den.aspects.users maybe?
  den.aspects.hosts.desktop = { host, ... }: {
    __functor = self: ctx: {
      # for each aspect in self.includes
      # for each capability in aspect.meta.requiredCapabilities
      # if capability in host.capability, add to includes, else add nothing (lib.optional)
      includes = builtins.filter (aspect:
        builtins.foldl' (acc: new: acc && host.capabilities.${new}.supported)
          true (aspect.meta.requiredCapabilities or [])
      ) self.includes;
    };
  };
}
