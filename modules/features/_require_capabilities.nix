{ host, home }:
requiredCapabilities:
output:
if (host ? capabilities && host.capabilities.has requiredCapabilities)
    || (home ? capabilities && home.capabilities.has requiredCapabilities) then
  output
else
  {}
