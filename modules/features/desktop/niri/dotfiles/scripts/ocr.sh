#!/usr/bin/env bash

set -e

# (`flock` makes sure that if you press escape to exit niri's screenshot UI without screenshotting,
# the next time you screenshot there will not be a second `inotifywait` spawned)
# (also, not using clipboard since `wl-paste --watch` is weird if you escape without screenshotting)
output=/tmp/ocr
niri msg action screenshot --path "$output" "$@" &&
  flock -n "$output.lock" -c "inotifywait -e close $output" &&
  tesseract $output stdout | wl-copy
