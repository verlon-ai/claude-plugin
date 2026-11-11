---
description: Move Claude Code between your Claude subscription (off) and Verlon (on), live
argument-hint: on | off
allowed-tools: Bash(verlon *), Bash(npx -y @verlon-ai/cli@latest *)
---

Move Claude Code between the user's own Claude subscription and Verlon.
The switch changes the user's Claude Code settings, and every running
session picks it up on its next message: no restart.

1. Run `verlon --format table switch $ARGUMENTS` (or
   `npx -y @verlon-ai/cli@latest --format table switch $ARGUMENTS` if `verlon` is not
   installed). With no argument it only says where requests go now.
2. Relay the CLI's output exactly, nothing added.
3. If it refuses because this session is on a model that only runs
   through Verlon, relay that line and stop. The user picks a Claude
   model with `/model`, then runs `/verlon:switch off` again. Never add
   `--anyway` yourself; mention it only as the user's choice.
4. If it says the switch happens after the next message (a long
   conversation compacts on the subscription first), relay that as is:
   it is expected, and nothing else is needed.

Never edit settings files or call APIs for this: the logic is in the
CLI. The dashboard is at https://verlon.ai/dashboard; never cite any
other URL.
