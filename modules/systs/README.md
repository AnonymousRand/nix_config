# `modules/host/`

host entities and aspects (`den.aspects.systs.<hostname>`) for each host, as well as any host-specific user configs per host (`den.aspects.user-hosts.<username>@<hostname>`).

### notes

- all hosts should include `den.aspects.systs.base`, which contains common configurations.
- all hosts should set syst and host settings; see [modules/settings/README.md](../settings/README.md) for where to set them.
