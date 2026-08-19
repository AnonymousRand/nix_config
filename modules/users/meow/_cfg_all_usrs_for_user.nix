# KEEP TRACK OF ALL HOSTS AND HOMES THAT THIS USER IS ON HERE!!

# use this to apply `usr` entity config (e.g. `usrSettings`) to all instances of this user's
# `usr` entities, i.e. all instances of this user on ALL hosts and homes!

# yes, i know this is incredibly stupid, but since this has to be imported at the very top level
# of a file, we can't access `den` here without infinite recursion. this means we can't dynamically
# generate this list from introspecting `den`, which is why this has to be hard-coded
#
# and until den implements actual host-agnostic user entities, this is probably the best we'll have

cfg: {
  den.hosts.x86_64-linux.snow-rainbow.users.meow = cfg;

  den.homes.x86_64-linux."meow@snow-rainbow" = cfg;
}
