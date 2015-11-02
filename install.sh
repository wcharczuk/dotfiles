#!/bin/sh

for name in *; do
target="$HOME/.$name"
if [ -e "$target" ]; then
    rm "$target"
fi
if [ "$name" != 'install.sh' ] && [ "$name" != 'assets' ] && [ "$name" != 'README.md' ]; then
  echo "Creating $target"
    ln -s "$PWD/$name" "$target"
fi
done
