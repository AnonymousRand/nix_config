# `modules/`

everything except very fundamental flake-related stuff should be in here :3

## general design

- den rundown:
    - den is governed by *aspects* which produce (usually reusable) behavior and *entities* which store data (e.g. for aspects to read in order to be more reusable, almost like providing function args).
    - entities also usually associated to aspect(s) (henceforth called "entity aspects") that are responsible for configuring the overarching behavior of that entity (e.g. which feature aspects to include), and inherit all the config from/is an "instance" of the den *schema* for its corresponding entity type.
    - each entity type also creates a den "context arg" that can be accessed in the arguments of aspects/class modules within aspects, much like `_module.args`, allowing aspects to read the data stored on those entities.

- i also have my own "settings" system ([./systs/settings/](./systs/settings), [./profiles/settings/](./profiles/settings)). settings are static data that can be set by each entity type and which:
    - *belongs* to and is only *produced* by an ENTITY (i.e., hosts/users/standalone homes etc.),
    - can be *consumed* by MULTIPLE ASPECTS.
- on the other hand, use *battery aspects* ([./batteries/](./batteries/)) for config/data that:
    - *belongs* to and is only *consumed* by an ASPECT,
    - can be *produced* by MULTIPLE ASPECTS.

    with that being said, settings may include associated "battery" aspects that read the relevant values from the declared settings options and do basic, unopinionated configs using them; also do this if the setting is only ever read by that one aspect. IMPORTANTLY, batteries in [./batteries/](./batteries/) should usually feel very "optional", whereas settings batteries should be more "broad" or generally applicable.

- in my design, there are currently the following entity types (`host`, `user`, and `home` are built-in den entities, while the rest are my own):

    | entity type: | what are they:                           | declared under:                               | instances of:       | responsible for settings like:                                            |
    | :----------: | :--------------------------------------: | :-------------------------------------------: | :-----------------: | :-----------------------------------------------------------------------: |
    | **host**     | nixos hosts                              | `den.hosts.<hostname>`                        | `den.schema.host`   | host-only: admin users, printers, integrated home manager `useGlobalPkgs` |
    | **user**     | users on *specific hosts*                | `den.hosts.<hostname>.`<br>`users.<username>` | `den.schema.user`   | host-specific overrides of `profile` settings                             |
    | **home**     | standalone home manager configurations   | `den.homes.`<br>`"<username>@<hostname>"`     | `den.schema.home`   | host-specific overrides of `profile` settings                             |
    | **syst**     | "system"-level entities: hosts and homes | `den.systs.<hostname>`                        | `den.schema.systm`  | hardware capabilties, nix state version, nixpkgs `allowUnfree`            |
    | **profile**  | "user"-level entities, "host-agnostic": users and homes   | `den.profiles.<username>`                     | `den.schema.profil` | username, display protocol, theming (colors, fonts, icons)                |

    moreover, the entity types, context args, aspects, and paths here under `modules/` interact in the following way (use this as a hopefully not too headache-inducing guide to where to place configs :3):

    ![a diagram showing the following: the `host` context arg pulls data from `host` entities; the `syst` context arg pulls data from `host`, `syst`, and `home` entities; the `home` context arg pulls data from `home` entities; the `profile` context arg pulls data from `home`, `profile`, and `user` entities; and the `user` context arg pulls data from `profile` and `user` entities. then, `host` entities pull behavior from `host` and `syst` aspects; `syst` entities pull behavior from `syst` aspects; `home` entities pull behavior from `syst`, `user-host`, and `profile` aspects; `profile` entities pull behavior from `profile` aspects; and `user` entities pull behavior from `user-host` and `user` aspects.](./_git_assets/nix_config_graph.png)

    notes:
        - the context args–entities edge is automatically built by den for built-in entity types and manually done by me for custom entity types at [./systs/internal/ctx_from_entities.nix](./systs/internal/ctx_from_entities.nix) and [./profiles/internal/ctx_from_entities.nix](./profiles/internal/ctx_from_entities.nix). the entities–entity aspects edge is all manually done by me at [./systs/internal/entities_from_aspects.nix](./systs/internal/entities_from_aspects.nix) and [./profiles/internal/entities_from_aspects.nix](./profiles/internal/entities_from_aspects.nix).
        - in den, `host` and `user` entities/context args are active when running `nixos-rebuild` with integrated home manager, while `home` is active when running standalone home manager. this means `syst` and `profile` never have to pull from two built-in entity types at the same time.
        - (`user-host` aspects break the symmetry since that is preserving a built-in den behavior as of den 0.19.0.)
        - (the `syst` and `profile` entities do not pull from the `syst` and `profile` entity aspects as those entities don't really need it—those aspects will always make it into the `syst` or `profile` context arg (which is where they actually mean something) via `host`/`home`/`user` entities, and it would also cause a lot of headache trying to add that.)
        - (user aspects shouldn't really ever be needed as there isn't much a user entity needs that isn't covered by its host-agnostic `profile` aspect or its host-specific `user-host` aspect.)

## notes

- generally, feature/functionality aspects should be written so that including them *activates* them, while entities like hosts and users may set extra config or options in their own aspects (but ideally in separate files still) to *configure* them. the activation and configuration are completely separate—avoid coupling them (e.g. by extending/including the activating aspect with user-specific config). one should be able to exist without the other.
    - the activating aspects are generally within the top-level subdirectories of `modules/` here (e.g. [./features/](./features/) and [./batteries/](./batteries/)), whereas entity-specific config for them should go under that entity's subdirectory (e.g. in `./hosts/<hostname>/` or `./users/<username/`).
    - my current convention is also to generally mirror the directory layout of `modules/` here inside those entity subdirectories for entity-specific config (e.g. see [./systs.snow-rainbow/](./systs.snow-rainbow/) or [./users/meow/](./users/meow)).

- when naming aspects, you should generally follow the filepaths starting from here; e.g. `den.aspects.batteries.<name>` for an aspect in `./batteries/<name>.nix` or `den.aspects.features.desktop.<name>` for an aspect in `./features/desktop/<name>.nix`.
- settings should declare custom options under `den.systs.<hostname>.settings`/`den.profiles.<username>.settings`/`den.hosts.<hostname>.settings` (which mimic den's native entity types), whereas battery aspects should declare class module custom options under `aspects.<aspect path>`.
