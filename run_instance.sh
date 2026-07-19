#!/bin/bash

# run_instance.sh — run your tool on a single instance and report the verdict.
# Arguments:
# - $1: interface version string, e.g. "v1"
# - $2: category, e.g. "AINNCS"
# - $3: benchmark, e.g. "TORA"
# - $4: instance,  e.g. "reach"
# Any further columns the category adds to instances.csv follow, in file order, and the
# results file to write is always the LAST argument.
#
# The harness owns timing: it measures wall-clock time and enforces the per-instance
# timeout (the "timeout" column in instances.csv, if the category sets one; otherwise
# the run is uncapped). Do not sleep to a deadline yourself.

set -e

VERSION_STRING="v1"
if [ "$1" != "$VERSION_STRING" ]; then
    echo "Expected first argument (version string) '$VERSION_STRING', got '$1'"
    exit 1
fi

CATEGORY="$2"
BENCHMARK="$3"
INSTANCE="$4"
# The results file is always the last argument.
RESULTS_FILE="${@: -1}"

echo "Running [$CATEGORY] $BENCHMARK / $INSTANCE -> $RESULTS_FILE"

# Stand-in for the actual tool run (~1s of "execution") so the skeleton is runnable
# as-is and usable as a test fixture.
# TODO: tool authors must replace this line with the real tool invocation.
sleep 1

VERDICT="unknown"   # one of: verified, falsified, unknown, error

# Write the results file: a header row plus one data row with a "result" column. A
# category may also read extra self-reported columns — AINNCS reads the CORA breakdown:
#   printf 'result,time_random,time_violation,time_reachable,time_verification\n' > "$RESULTS_FILE"
#   printf '%s,%s,%s,%s,%s\n' "$VERDICT" "$t_rand" "$t_viol" "$t_reach" "$t_verif" >> "$RESULTS_FILE"
printf 'result\n%s\n' "$VERDICT" > "$RESULTS_FILE"
