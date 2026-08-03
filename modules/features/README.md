# `modules/features/`

reusable "feature" aspects like apps, programs, and services. each one here should enable the relevant feature(s) for all relevant class modules and provide basic, relatively unopinionated config.

### notes

- use `den.aspects.features.<feature name>` for feature aspects!
- features are (mostly) sorted into groups like `system` and `tools`, and their aspect names should also reflect this by doing `den.aspects.features.tools.hyfetch` (for example) instead of just `den.aspects.features.hyfetch`.
