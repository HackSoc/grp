#!/bin/bash

# Uninstall a single package


if [[ -z "$GRPDIR" ]]; then
    echo "\$GRPDIR is not set." >&2
    exit 1
fi

if [[ -z "$STOWDIR" ]]; then
    echo "\$STOWDIR is not set." >&2
    exit 1
fi

if [[ ! -d "$GRPDIR" ]]; then
    echo "$GRPDIR not found." >&2
    exit 1
fi

if [[ ! -d "$STOWDIR" ]]; then
    echo "$STOWDIR not found." >&2
    exit 1
fi

export PACKAGE=$1

if [[ ! -e $PACKAGE ]]; then
    echo "$PACKAGE not found." >&2
    exit 1
fi

source $PACKAGE

cd $STOWDIR
stow -t $GRPDIR -D $pkgname
