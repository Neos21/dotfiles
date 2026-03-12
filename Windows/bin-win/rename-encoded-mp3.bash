#!/usr/bin/env bash

# Rename Files
find '.' -maxdepth 1 -name '*.mp3' | sed "s/^/'/" | sed "s/$/'/" | sed 'p;s/_//'             | xargs -n2 mv -n
find '.' -maxdepth 1 -name '*.mp3' | sed "s/^/'/" | sed "s/$/'/" | sed 'p;s/.flac.mp3/.mp3/' | xargs -n2 mv -n
find '.' -maxdepth 1 -name '*.mp3' | sed "s/^/'/" | sed "s/$/'/" | sed 'p;s/.m4a.mp3/.mp3/'  | xargs -n2 mv -n
find '.' -maxdepth 1 -name '*.mp3' | sed "s/^/'/" | sed "s/$/'/" | sed 'p;s/.mp4.mp3/.mp3/'  | xargs -n2 mv -n

echo 'Finished'
