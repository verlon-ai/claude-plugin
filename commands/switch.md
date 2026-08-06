---
description: Switch which model this session routes to (no restart)
argument-hint: <model-id>
allowed-tools: Bash(verlon *), Bash(npx -y @verlon-ai/cli@latest *)
---

Switch the Verlon gate this project routes through to a different
model. The swap happens server-side, so it takes effect on the next
turn of this very session — no restart.

1. Run `verlon switch $ARGUMENTS` (or
   `npx -y @verlon-ai/cli@latest switch $ARGUMENTS` if `verlon` is not
   installed).
2. If no model id was given, or the CLI reports the model is invalid,
   run `verlon models` and show the user the available ids so they can
   pick one.
3. On success, relay the old → new model line and remind the user the
   change applies from the next message onward.

The switch logic lives entirely in the CLI — never edit settings files
or call APIs directly for this. The dashboard is at
https://verlon.ai/dashboard — never cite any other URL.
