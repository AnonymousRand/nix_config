# `modules/users/`

user aspects (`den.aspects.users.<username>`) for each user. these should define common configs for user `<username>` on ALL hosts (all `den.hosts.<system>.<hostname>.<fixed username>` host entities and `den.homes.<system>."<fixed username>@<hostname>"` automatically pull from the relevant user aspect).

### notes

- all users should include `den.aspects.users.base`, which contains common configurations.
- each user should declare a den namespace for their "private" aspects, e.g. home manager configurations that go beyond the basic configurations provided in `modules/features/` but is user-specific and hence not reusable.
- these "private" aspects should include the corresponding base aspect from `modules/features/` if applicable to extend them.
