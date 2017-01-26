#!/bin/bash
set -e

case "$1" in
  'restore'|'dump'|'index-rebuild')
    cmd=${1};shift 1; exec rethinkdb-${cmd} "$@";;

  *)
    exec "$@";;
esac

