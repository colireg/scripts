#!/usr/bin/env bash

find $1 -type f \( -name "*.txt" -o -name "*.tar" \) \
    -exec gpg --batch --yes -cav --passphrase-file $2 "{}" \;
