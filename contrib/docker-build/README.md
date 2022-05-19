# Build Server via Docker

This folder contains tools that pull the latest development code from GitHub then builds linux binaries

## Build

Use the command:

`docker build -t vmangos-build .`

## Usage

Use the command, replacing (Install Dir) with the folder you want to install vmangos to:

`docker run --rm -v (Install Dir):/root/vmangos/out vmangos-build`