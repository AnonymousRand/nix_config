#!/usr/bin/env bash

output=/tmp/annotated_screenshot

set -e

# (`flock` makes sure that if you press escape to exit niri's screenshot UI without screenshotting,
# the next time you screenshot there will not be a second `inotifywait` spawned that ends up opening
# two instances of satty)
# (also, not using clipboard since `wl-paste --watch` is weird if you escape without screenshotting)
niri msg action screenshot --path "$output" "$@" &&
  flock -n "$output.lock" -c "inotifywait -e close $output" &&
  satty --filename "$output"
