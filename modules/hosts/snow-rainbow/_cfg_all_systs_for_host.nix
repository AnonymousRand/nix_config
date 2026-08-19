# KEEP TRACK OF ALL HOSTS AND HOMES FOR THIS HOST HERE!!

# use this to apply `syst` entity config (e.g. `systSettings`) to all instances of this host's
# `syst` entities, i.e. its host + ALL homes on it!
# (although currently somewhat limited in functionality, e.g. when it comes to parametric stuff)

cfg: {
  den.hosts.x86_64-linux.snow-rainbow = cfg;

  den.homes.x86_64-linux = {
    "meow@snow-rainbow" = cfg;
  };
}
