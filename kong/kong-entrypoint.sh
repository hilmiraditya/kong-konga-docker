#!/bin/sh

set -e

buildDepsApk="
curl
libc-dev
gcc
wget
"

pm='unknown'
if [ -e /lib/apk/db/installed ]; then
    pm='apk'
fi

if [ "$pm" = 'apk' ]; then
    apk add --no-cache ${buildDepsApk}
fi

luarocks install $@

if [ "$pm" = 'apk' ]; then
    apk del ${buildDepsApk}
fi