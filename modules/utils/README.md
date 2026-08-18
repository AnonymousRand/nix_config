# `modules/utils/`

reusable utility or "battery" aspects that usually declare their own options/consume extra data for configuration. these options:
- *belong* to ASPECTS,
- are only *consumed* by THAT ASPECT,
- can be *produced* by MULTIPLE ASPECTS.

(settings belonging to an ENTITY should see [modules/settings/](../settings/) instead.)

### notes

- to use these aspects, simply include them into host/user aspects to *activate* them, and set declared options as needed (preferably into the host/user aspect directly—although ideally in a separate file—so no additional include is needed) to *configure* them.
- often these options are declared inside a class module instead of on the aspect level itself, since accessing aspect-level options from within a class module is kinda weird in den >w<. i have also chosen to avoid den's quirks as those do not allow hierarchical names and hence can get messy to keep track of.
