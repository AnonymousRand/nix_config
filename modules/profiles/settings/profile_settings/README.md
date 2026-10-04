# `modules/profiles/settings/profile_settings/`

user-wide (and generally host-agnostic) settings that aspects may need to reference.

## notes

- IMPORTANT: it seems that the `profileSettings` context arg will only be in scope on aspects that are included into *users* or *homes* instead of hosts (otherwise it must be provided to users explicitly by hosts via `provides.to-users`). in other words, trying to capture `profileSettings` on an aspect which is only included into host entities means that aspect will never be evaluated. (the same is true for system settings and hosts/homes, but in that case user entity aspects will always have a host in scope by the time they are evaluated, so it's never an issue there.)
