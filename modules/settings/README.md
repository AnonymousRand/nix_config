# `modules/settings/`

static and broad entity (e.g. host/user) settings that aspects may need to reference.

settings should:
- declare options under `systSettings`/`usrSettings` etc. in an entity kind/schema
- not produce any data on its own
- optionally include an associated "battery" aspect that reads the values from the declared options and does basic, unopinionated configs with them

entities are responsible for producing the data on these options.
