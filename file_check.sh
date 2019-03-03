#!/usr/bin/env sh


if [ -e /tmp/warning ]; then
  exit 1
elif [ -e /tmp/critical ]; then
  exit 2
fi

exit 0
