{
  # TODO: if this works, try moving this to a schema's includes or something
  # that prob won't work though; in that case have to manually iterate through den.aspects.hosts
  # and den.aspects.users maybe?
  #den.aspects.hosts.desktop = { host, ... }: {
  #  __functor = self: ctx: {
  #    includes = builtins.filter (aspect:
  #      builtins.foldl' (acc: new: acc && host.capabilities.${new}.supported)
  #        true (aspect.meta.requiredCapabilities or [])
  #    ) self.includes;
  #  };
  #};
  #den.aspects.features.tools.brightnessctl = { host, config, lib, ... }: {
  #  __functor = self: ctx:
  #    let
  #      #areRequiredCapabilitiesMet =
  #      #  builtins.foldl' (acc: new: acc && host.capabilities.${new}.supported)
  #      #  true config.meta.requiredCapabilities;
  #      areRequiredCapabilitiesMet = false;
  #    in
  #    {
  #      nixos = lib.mkIf areRequiredCapabilitiesMet self.nixos;
  #      homeManager = lib.mkIf areRequiredCapabilitiesMet self.homeManager;
  #    };
  #};
}
