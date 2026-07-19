# ARCH-COMP tool skeleton

Minimal skeleton for an ARCH-COMP tool submission. Each script has its argument
parsing in place and `TODO`s where your tool-specific logic goes.

An ARCH-COMP tool targets one **category** (AFF, NLN, AINNCS, …) and runs on the
benchmarks of that category you select. Your tool runs inside a Docker base image you
name on the submission form; the platform clones this repository into it.

Scripts (run on the worker):

- `install_tool.sh` — run once to install the tool (dependencies, build, license).
- `prepare_instance.sh` — run before each instance; receives the instance's
  `instances.csv` columns in order. A nonzero exit skips the instance.
- `run_instance.sh` — run the tool on one instance; receives the instance's columns in
  order, then the results file to write as the last argument. Write your verdict there.

The harness owns timing: it measures wall-clock time and enforces the per-instance
timeout (the `timeout` column in `instances.csv`, if the category sets one). Your
`run_instance.sh` only reports the verdict.

See the toolkit info page for the full pipeline and the results-file format.
