#!/bin/bash

# Install all packages to /tmp/hacksoc-grp

export GRPDIR=${GRPDIR:-/tmp/hacksoc-grp}
export STOWDIR=${STOWDIR:-/tmp/hacksoc-grp/packages}

if [[ ! -d "$GRPDIR" ]]; then
    echo "$GRPDIR not found." >&2
    exit 1
fi

if [[ ! -d "$STOWDIR" ]]; then
    echo "$STOWDIR not found." >&2
    exit 1
fi

cd packages
for package in *; do
    echo "Installing $package..."
    ../install.sh $package
    echo
done
