host:
requiredCapabilities:
output:
let
  areRequiredCapabilitiesMet =
    builtins.foldl' (acc: new: acc && host.capabilities.${new}.supported)
    true requiredCapabilities;
in
if areRequiredCapabilitiesMet then
  output
else
  {}
