# so like why

by default, GTK apps are rendered with libadwaita, whose [src/stylesheet/_colors.scss](https://github.com/GNOME/libadwaita/blob/42f647ffcbec3282c126ad9153c77baecf86ba90/src/stylesheet/_colors.scss#L270) very frustratingly sets a bunch of defaults, like using `currentColor` (the *foreground* color) mixed with varying amounts of `transparent` to define certain *background* colors.

what the fuck.

so here's my attempt to make it somewhat make sense.

(i am definitely more qualified to talk about styling than adwaita's developers :p)
