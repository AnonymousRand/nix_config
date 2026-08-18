# `modules/settings/usr_settings/`

user-wide settings that aspects may need to reference, like fonts and theme.

### notes

- a den policy is used to "wire" everything together, by injecting `usrSettings` as a context arg whenever a user or home entity is in scope.
- note that currently, all options on defined on the base user *aspect* instead of the user *schema* (as is the case with system settings) as user *schema*/*entities* are unfortunately per-host in den instead of per-user, and i want these settings to be host-agnostic.
