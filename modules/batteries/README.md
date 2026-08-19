# `modules/batteries/`

reusable "battery" or utility aspects that usually consume extra data (e.g. in the form of custom options or den quirks) for configuration. these options:
- *belong* to ASPECTS,
- are only *consumed* by THAT ASPECT,
- can be *produced* by MULTIPLE ASPECTS.

(settings belonging to an ENTITY should see [modules/settings/](../settings/) instead.)

### notes

- use these aspects as described in the general [modules/](../modules) readme: simply include them into host/user aspects to *activate* them, and set declared options as needed (preferably into the host/user aspect directly—although ideally in a separate file—so no additional include is needed) to *configure* them.
- currently, there are two ways for these aspects to consume data:
    - den quirks, which are essentially special variables that any aspect anywhere can produce data on and a consumer can just pull from. these are convenient, but avoid these if you can since they are forced to have flat names and hence can get messy in large amounts. (e.g. everything not currently in [./theme/](./theme/).)
    - custom module options, declared inside a class module like `homeManager` or `nixos` (i would love to have aspect-level options, but currently that doesn't work super well in den). use these over quirks if the data only needs to be consumed and produced from one class module and sort of conceptually fits the idea of being more "class-specific" instead of necessarily "aspect-specific". (e.g. everything currently in [./theme/](./theme/).)
