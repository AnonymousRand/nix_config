# `modules/host/`

host entities and aspects (`den.aspects.hosts.<hostname>`) for each host, as well as any host-specific user configs per host (`den.aspects.user-host.<username>@<hostname>`).

### notes

- all hosts should include `den.aspects.hosts.base`, which contains common configurations.
- all hosts should set syst and host settings; see [modules/settings/README.md](../settings/README.md) for where to set them.
