# `modules/homes/`

standalone home manager configurations. (think of and structure these basically as hosts, except we don't get access to system-level config.)

### notes

- IMPORTANT: homes here must set `syst_settings` and/or `profile_settings` if their corresponding host or user is not already declared in `hosts/` or `users/`! this is on a case-by-case basis.
- keep standalone home manager configs that are tied to an actual host (e.g. for testing standalone) in `modules/hosts/` though :3
