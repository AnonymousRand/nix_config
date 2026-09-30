# `modules/homes/`

standalone home manager configurations. (think of and structure these basically as hosts, except we don't get access to system-level config.)

### notes

- all homes should include both a username and a hostname, and they should set syst and profile settings IF their corresponding host or user is not already declared in `hosts/` or `users/`; see [modules/settings/README.md](../settings/README.md) for where to set them.
- keep standalone home manager configs that are tied to an actual host in `hosts/` (e.g. for testing standalone) in `modules/hosts/` :3
