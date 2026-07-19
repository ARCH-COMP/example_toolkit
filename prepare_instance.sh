#!/bin/bash

# prepare_instance.sh — run before each instance.
#
# It receives every column of the instance's row in instances.csv, in file order. For
# the default layout that is:
# - $1: benchmark, e.g. "TORA"
# - $2: instance,  e.g. "reach"
# A category may add further columns; they follow, in order (a "timeout" column, if the
# category sets one, is among them).
#
# A nonzero exit code skips this instance.

set -e

BENCHMARK="$1"
INSTANCE="$2"

echo "Preparing $BENCHMARK / $INSTANCE"

# TODO: prepare anything this instance needs (compile the model, warm caches, ...).

exit 0
