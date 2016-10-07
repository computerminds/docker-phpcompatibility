#!/usr/bin/env bash
set -e

PHPCS="$(which phpcs)"

# We omit our default --standard=PHPCompatibility option if it is
# provided some other way at run-time.
if [[ ! -e phpcs.xml && ! -e phpcs.dist.xml && ! "${@}" == *--standard=* ]]; then
  PHPCS="$PHPCS --standard=PHPCompatibility"
fi

eval "${PHPCS} $@"
