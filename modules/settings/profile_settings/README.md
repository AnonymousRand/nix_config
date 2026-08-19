# `modules/settings/profile_settings/`

user-wide settings that aspects may need to reference, like fonts and theme.

### notes

- IMPORTANT: it seems that the `profileSettings` context arg will only be in scope on aspects that are included into *users* or *homes* instead of hosts (or provided to users explicitly by hosts via `provides.to-users`). in other words, trying to capture `profileSettings` on an aspect which is only included into host entities means that aspect will never be evaluated. (the same is true for system settings and hosts/homes, but in that case user entity aspects will always have a host in scope by the time they are evaluated, so it's never an issue there.)
- unfortunately, den's user entities cannot be host-agnostic, so you must declare the settings on every instance of a user entity across all its hosts (e.g. use a let-in), as well as on standalone homes. (i may try to automate this in the future.)
- a den policy is used to "wire" everything together, by injecting `profileSettings` as a context arg whenever a user or home entity is in scope.
