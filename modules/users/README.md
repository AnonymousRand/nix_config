# `modules/users/`

user aspects (`den.aspects.users.<username>`) for each user. these should define common configs for user `<username>` on ALL hosts (all `den.hosts.<system>.<hostname>.<fixed username>` host entities and `den.homes.<system>."<fixed username>@<hostname>"` automatically pull from the relevant user aspect).

### notes

- all users should include `den.aspects.users.base`, which contains common configurations.
- all users should use a `_cfg_all_profiles_for_user.nix` similar to [./meow/_cfg_all_profiles_for_user.nix](./meow/_cfg_all_profiles_for_user.nix) to apply settings to ALL `profile` entities corresponding to that user (e.g. all the standalone homes and host-specific user entities corresponding to it); see the file for more details.
