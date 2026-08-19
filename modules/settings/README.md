# `modules/settings/`

static, general settings that:
- *belong* to ENTITIES (i.e., hosts/users/standalone homes etc.),
- are only *produced* by THAT ENTITY,
- can be *consumed* by MULTIPLE ASPECTS.

(settings belonging to just an ASPECT should see [modules/batteries/](../batteries/) instead.)

### notes

- there are currently three types of entities i name here:
    - `syst`s are den host and home entities, which control system-level settings like hardware capabilities, and that should be common to both hosts and standalone homes.
    - `profile`s are den home and user entities, which control user-specific settings like fonts or username, and that should be common to both standalone homes and users (on hosts).
    - `host`s are just den hosts, which control system-level settings that do not apply to standalone homes like the `home-manager.useGlobalPkgs` option.
- settings should declare options under `systSettings`/`profileSettings`/`hostSettings` etc. in an entity schema.
- settings may include associated "battery" aspects that read the relevant values from the declared settings options and do basic, unopinionated configs using them. use these batteries as described in the general [modules/](../modules) readme: include them in an entity's *aspect* to *activate* them, and set the corresponding settings in the entity to *configure* them (which you should probably be doing anyway).
