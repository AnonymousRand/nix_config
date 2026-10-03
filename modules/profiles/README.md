# `modules/users/`

user aspects (`den.aspects.profiles.<username>`) for each user. these should define common configs for user `<username>` on ALL hosts (all `den.hosts.<system>.<hostname>.<fixed username>` host entities and `den.homes.<system>."<fixed username>@<hostname>"` automatically pull from the relevant user aspect).

### notes

- all users should include `den.aspects.profiles.base`, which contains common configurations.
- all users should set profile settings; see [modules/settings/README.md](../settings/README.md) for where to set them.
