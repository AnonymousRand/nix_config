# `modules/`

everything except very fundamental flake-related stuff should be in here :3

### notes

- generally, feature/functionality aspects should be written so that including them *activates* them, while entities like hosts and users may set extra config or options in their own aspects (but ideally in separate files still) to *configure* them. the activation and configuration are completely separate—avoid coupling them (e.g. by extending/including the activating aspect with user-specific config). one should be able to exist without the other.
    - the activating aspects are generally within the top-level subdirectories of `modules/` here (e.g. [./features/](./features/) and [./batteries/](./batteries/)), whereas entity-specific config for them should go under that entity's subdirectory (e.g. in `./hosts/<hostname>/` or `./users/<username/`).
    - my current convention is also to generally mirror the directory layout of `modules/` here inside those entity subdirectories for entity-specific config (e.g. see [./hosts/snow-rainbow/](./hosts/snow-rainbow/) or [./users/meow/](./users/meow)).
- when naming aspects, you should generally follow the filepaths starting from here; e.g. `den.aspects.batteries.<name>` for an aspect in `./utils/<name>.nix` or `den.aspects.features.desktop.<name>` for an aspect in `./features/desktop/<name>.nix`. the same goes with declared options.
