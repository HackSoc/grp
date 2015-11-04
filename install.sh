#!/bin/bash

# Install a single package

if [[ -z "$GRPDIR" ]]; then
    echo "\$GRPDIR is not set." >&2
    exit 1
fi

if [[ ! -d "$GRPDIR" ]]; then
    echo "$GRPDIR not found." >&2
    exit 1
fi

export STOWDIR="$GRPDIR/packages"

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

export PKGDIR=$STOWDIR/$pkgname

if [[ -e "$PKGDIR" ]]; then
    echo "$PKGDIR already exists, not building..." >&2
else
    tmpdir=`mktemp -d`
    cd $tmpdir
    build
    rm -rf $tmpdir
fi

cd $STOWDIR
stow --ignore=README $stow_opts $pkgname
