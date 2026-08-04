# `modules/settings/syst_settings/`

system-wide settings that aspects may need to reference, like host capabilities and quirks (a den feature that collects data across arbitrary aspects).

### notes

- a den policy is used to "wire" everything together, by injecting `systSettings` as a context arg whenever a host or home entity is in scope.
