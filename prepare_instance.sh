#!/bin/bash

# prepare_instance.sh — run before each instance.
# Arguments:
# - $1: interface version string, e.g. "v1"
# - $2: category, e.g. "AINNCS"
# - $3: benchmark, e.g. "TORA"
# - $4: instance,  e.g. "reach"
# Any further columns the category adds to instances.csv follow, in file order.
#
# A nonzero exit code skips this instance.

set -e

VERSION_STRING="v1"
if [ "$1" != "$VERSION_STRING" ]; then
    echo "Expected first argument (version string) '$VERSION_STRING', got '$1'"
    exit 1
fi

CATEGORY="$2"
BENCHMARK="$3"
INSTANCE="$4"

echo "Preparing [$CATEGORY] $BENCHMARK / $INSTANCE"

# TODO: prepare anything this instance needs (compile the model, warm caches, ...).

exit 0
