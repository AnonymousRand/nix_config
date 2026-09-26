# `modules/settings/syst_settings/`

system-wide settings that aspects may need to reference, like system capabilities.

### notes

- a den policy is used to "wire" everything together, by injecting `systSettings` as a context arg whenever a host or home entity is in scope—see [./internal/](./internal/).
