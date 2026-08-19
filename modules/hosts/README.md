# `modules/host/`

host entities and aspects (`den.aspects.hosts.<hostname>`) for each host.

### notes

- all hosts should include `den.aspects.hosts.base`, which contains common configurations.
- all hosts should use a `_cfg_all_systs_for_hosts.nix` similar to [./snow-rainbow/_cfg_all_systs_for_hosts.nix](./snow-rainbow/_cfg_all_systs_for_hosts.nix) to apply settings to ALL `syst` entities corresponding to that host (e.g. all the standalone homes bound to it in addition to the host entity); see the file for more details.
