#!/bin/bash

# Install all packages to /tmp/hacksoc-grp

export GRPDIR=${GRPDIR:-/tmp/hacksoc-grp}

if [[ ! -d "$GRPDIR" ]]; then
    echo "$GRPDIR not found." >&2
    exit 1
fi

if [[ ! -d "$GRPDIR/packages" ]]; then
    echo "$GRPDIR/packages not found." >&2
    exit 1
fi

cd packages
for package in *; do
    echo "Installing $package..."
    ../install.sh $package
    echo
done
