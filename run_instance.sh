#!/bin/bash

# run_instance.sh — run your tool on a single instance and report the verdict.
#
# It receives every column of the instance's row in instances.csv, in file order,
# followed by the results file to write as the LAST argument:
# - $1 .. $(n-1): the instance's columns (benchmark, instance, [category columns...])
# - $n:           path to the results file to write
# For the default layout: $1=benchmark, $2=instance, $3=results file.
#
# The harness owns timing: it measures wall-clock time and enforces the per-instance
# timeout (the "timeout" column in instances.csv, if the category sets one; otherwise
# the run is uncapped). Do not sleep to a deadline yourself.

set -e

# The results file is always the last argument; the instance's columns are the rest.
RESULTS_FILE="${@: -1}"
BENCHMARK="$1"
INSTANCE="$2"

echo "Running $BENCHMARK / $INSTANCE -> $RESULTS_FILE"

# Stand-in for the actual tool run (~1s of "execution") so the skeleton is runnable
# as-is and usable as a test fixture.
# TODO: tool authors must replace this line with the real tool invocation.
sleep 1

VERDICT="unknown"   # one of: verified, falsified, unknown, error

# Write the results file: a header row plus one data row. It must contain a "result"
# column. A category may also read extra self-reported columns — for example AINNCS
# reads the CORA timing breakdown:
#   printf 'result,time_random,time_violation,time_reachable,time_verification\n' > "$RESULTS_FILE"
#   printf '%s,%s,%s,%s,%s\n' "$VERDICT" "$t_rand" "$t_viol" "$t_reach" "$t_verif" >> "$RESULTS_FILE"
printf 'result\n%s\n' "$VERDICT" > "$RESULTS_FILE"
