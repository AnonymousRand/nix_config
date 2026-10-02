# `modules/`

everything except very fundamental flake-related stuff should be in here :3

### notes

- generally, feature/functionality aspects should be written so that including them *activates* them, while entities like hosts and users may set extra config or options in their own aspects (but ideally in separate files still) to *configure* them. the activation and configuration are completely separate—avoid coupling them (e.g. by extending/including the activating aspect with user-specific config). one should be able to exist without the other.
    - the activating aspects are generally within the top-level subdirectories of `modules/` here (e.g. [./features/](./features/) and [./batteries/](./batteries/)), whereas entity-specific config for them should go under that entity's subdirectory (e.g. in `./hosts/<hostname>/` or `./users/<username/`).
    - my current convention is also to generally mirror the directory layout of `modules/` here inside those entity subdirectories for entity-specific config (e.g. see [./hosts/snow-rainbow/](./hosts/snow-rainbow/) or [./users/meow/](./users/meow)).
- when naming aspects, you should generally follow the filepaths starting from here; e.g. `den.aspects.batteries.<name>` for an aspect in `./utils/<name>.nix` or `den.aspects.features.desktop.<name>` for an aspect in `./features/desktop/<name>.nix`. the same goes with declared options.

### explaining my brain child: entity types and settings

- there are currently three types of entities i use:
    - `syst`s are den host and home entities, which control system-level settings like hardware capabilities, and that should be common to both hosts and standalone homes on that host.
    - `profile`s are den user and home entities, which control user-specific settings like fonts or username, and that should be common to both users and standalone homes under that user's name.
    - `host`s are just den hosts, which control system-level settings that do not apply to standalone homes like the `home-manager.useGlobalPkgs` option.
- as of den 0.19.0, there are the following kinds of "entity aspects" that my config supports:
    - `den.aspects.systs.<hostname>`: config for a host.
    - `den.aspects.users.<username>`: config for a user (regardless of host).
    - `den.aspects.user-systs."<username>@<hostname>"`: host-specific config for a user AND config for a standalone home manager, like in original den. (the former should be avoided as much as possible though since it's a bit awkward where to place it (currently: under `hosts/`), and ideally there shouldn't need to be very much such specifics.)
- use *settings* (e.g. [./systs/settings/](./systs/settings/)), which are associated with each of the entity types, for config/data that:
    - *belongs* to and is only *produced* by an ENTITY (i.e., hosts/users/standalone homes etc.),
    - can be *consumed* by MULTIPLE ASPECTS.

    on the other hand, use *battery aspects* ([./batteries/](./batteries/)) for config/data that:
    - *belongs* to and is only *consumed* by an ASPECT,
    - can be *produced* by MULTIPLE ASPECTS.

    with that being said, settings may include associated "battery" aspects that read the relevant values from the declared settings options and do basic, unopinionated configs using them; also do this if the setting is only ever read by that one aspect. use these batteries as described above: include them in an entity's *aspect* to *activate* them, and set the corresponding settings in the entity to *configure* them (which you should probably be doing anyway). IMPORTANTLY, batteries in [./batteries/](./batteries/) should usually feel very "optional", whereas settings batteries should be more "broad" or generally applicable.

- settings should declare custom options under `den.systs.<hostname>.settings`/`den.profiles.<username>.settings`/`den.hosts.<hostname>.settings` (which mimic den's native entity types).
