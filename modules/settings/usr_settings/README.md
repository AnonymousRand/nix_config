# `modules/settings/usr_settings/`

user-wide settings that aspects may need to reference, like fonts and theme.

### notes

- unfortunately, den's user entities cannot be host-agnostic, so you must declare the settings on every instance of a user entity across all its hosts (e.g. use a let-in), as well as on standalone homes. however, you do NOT need to declare them on a standalone home which is bound to a user entity, as it seems to automatically get everything from the user entity.
- a den policy is used to "wire" everything together, by injecting `usrSettings` as a context arg whenever a user or home entity is in scope.
