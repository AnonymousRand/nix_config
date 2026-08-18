# `modules/utils/`

reusable utility or "battery" aspects that usually declare their own options/consume extra data for configuration. to use one, simply include it into a host/user aspect to *activate* it, and set declared options as needed (preferably into the host/user aspect directly, so no additional include is needed) to *configure* it.

### notes

- often these options are declared inside a class module instead of on the aspect level itself, since accessing aspect-level options from within a class module is kinda weird in den >w<. i have also chosen to not use den's quirks as those do not allow hierarchical names and hence can get messy and hard to keep track of.
