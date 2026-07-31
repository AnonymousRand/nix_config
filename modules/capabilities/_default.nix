{ den, ... }: {
  # >in this file, import aspects.capabilites to all relevant schema, and add option includesRaw to
  # those schema
  # in aspects.capabilities, set includes to be host.includesRaw or whatever except with filtering



#  den.aspects.hosts.desktop = {
#    __functor = self: ctx: {
#      includes = self.includes ++ [ { provides.to-users.homeManager.programs.mpv.enable = true; } ];
#    };

    #__functor = self: ctx: {
    #  includes = lib.filter (aspect:
    #    builtins.foldl' (acc: new: acc && host.capabilities.${new}.supported)
    #    true (aspect.meta.requiredCapabilities or [])
    #  ) self.includes;
    #};
    #includes = builtins.map (aspect:
    #  if !(aspect ? nixos || aspect ? homeManager) then
    #    aspect
    #  else
    #    let
    #      areRequiredCapabilitiesMet =
    #        builtins.foldl' (acc: new: acc && host.capabilities.${new}.supported)
    #        true (aspect.meta.requiredCapabilities or []);
    #    in
    #    lib.optionalAttrs areRequiredCapabilitiesMet aspect
    #) config.includes;
  };
}

#{ den, host, lib, ... }:
#let
#  newAspects = self: (
#    builtins.mapAttrs (key: value:
#      if !(value ? nixos || value ? homeManager) then
#        # continue if not aspect
#        value
#      else
#        # if aspect, determine if its required capabilities are met
#        let
#          areRequiredCapabilitiesMet =
#            builtins.foldl' (acc: new: acc && host.capabilities.${new}.supported)
#            true (value.meta.requiredCapabilities or []);
#        in
#        lib.optionalAttrs areRequiredCapabilitiesMet (
#          value // { nixos = {}; } // { homeManager = {}; }
#        )
#    ) aspectsCopy
#  );
#in
#{
#  den.aspects = lib.fix newAspects;
#
#let
#  aspectsCopy = {} // den.aspects;
#in
#{
#  den.aspects =
#    builtins.mapAttrs (key: value:
#      if !(value ? nixos || value ? homeManager) then
#        # continue if not aspect
#        value
#      else
#        # if aspect, determine if its required capabilities are met
#        let
#          areRequiredCapabilitiesMet =
#            builtins.foldl' (acc: new: acc && host.capabilities.${new}.supported)
#            true (value.meta.requiredCapabilities or []);
#        in
#        lib.optionalAttrs areRequiredCapabilitiesMet (
#          value // { nixos = {}; } // { homeManager = {}; }
#        )
#    ) aspectsCopy;

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
#}
