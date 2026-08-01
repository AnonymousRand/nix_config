{ den, lib, ... }: {
  den.policies.headed-server = [
    (den.lib.policy.resolve { isHeaded = true; })
  ];
}

# so we want a "headed" tag for hosts. if a host is headed:
# - include desktop-utils
# - users include desktop-utils.wayland, niri, noctalia, etc desktop stuff
# - host must? set display outputs? or maybe it gets to set it?
# PROBLEM: roles only allow you to forward one class at a time instead of the entire aspect!

# instead: using policy.include maybe? include the policy in all headed servers, and what to inject??
# or maybe: use policy.resolve to inject "headed" flag into all headed servers, and have a parametric
# user aspect? or if overloading user aspect is not supported: check for this "headed" flag in all
# desktop-related feature aspects? also does this flag carry down to all user scopes?

# dumb solution: just put an option in host schema for "is headed" and check that in user includes
# to install desktop-utils.wayland, niri, noctalia. if possible, in base host, include desktop-utils
# if this option is true?
