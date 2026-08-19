# `modules/settings/`

static, general settings that:
- *belong* to ENTITIES (i.e., hosts/users/standalone homes etc.),
- are only *produced* by THAT ENTITY,
- can be *consumed* by MULTIPLE ASPECTS.

(settings belonging to just an ASPECT should see [modules/utils/](../utils/) instead.)

### notes

- settings should declare options under `systSettings`/`profileSettings` etc. in an entity schema.
- settings data should only be produced by ENTITIES, not the entities' aspects or any other aspect.
- settings may include associated "battery" aspects that read the relevant values from the declared settings options and do basic, unopinionated configs using them. to use these batteries, include them in an entity's *aspect* to *activate* them, and set the corresponding settings in the entity to *configure* them (as you should probably be doing anyway).
