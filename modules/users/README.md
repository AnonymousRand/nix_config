# `modules/users/`

user aspects (`den.aspects.<username>`) for each user. these should define common configs for `<username>` on ALL hosts, as all `den.hosts.<system>.<hostname>.<fixed username>` host entities and `den.homes.<system>."<fixed username>@<hostname>"` automatically pull from the user aspect `den.aspects.<fixed username>`.
