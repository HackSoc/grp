#!/bin/bash

cd packages
for package in *; do
    echo "Installing $package..."
    ../install.sh $package
    echo
done
