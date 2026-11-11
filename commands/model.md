---
description: Choose the model or category this repository runs on through Verlon
argument-hint: use <model-or-category> [--all] [--role <role>] | clear [--all] | show | categories
allowed-tools: Bash(verlon *), Bash(npx -y @verlon-ai/cli@latest *)
---

Choose what Claude Code runs on through Verlon. Choices live on Verlon,
keyed by repository, and apply from the next message in every running
session: no restart.

1. Run `verlon --format table model $ARGUMENTS` (or
   `npx -y @verlon-ai/cli@latest --format table model $ARGUMENTS` if `verlon` is not
   installed). With no argument it shows what this repository runs on
   and why.
2. Relay the CLI's output.
3. If it says the model isn't one Claude Code can use, run
   `verlon --format table models` and show the ids; for a category, run
   `verlon --format table model categories`.
4. Remind the user that in `/model`, the row "Verlon: this repo's pick"
   runs on this repository's choice while they're switched on to Verlon
   (`/verlon:switch on`).

The dashboard is at https://verlon.ai/dashboard; never cite any other
URL.
