---
description: Verify the Verlon connection is healthy end-to-end
allowed-tools: Bash(verlon *), Bash(npx -y @verlon-ai/cli@latest *), Bash(cat .claude/settings.local.json)
---

Verify this project's Verlon connection: traffic arriving, sessions
grouping, costs accruing.

1. Read the connected gate id: it is the `ANTHROPIC_MODEL` value in
   `.claude/settings.local.json` (strip any `/suffix`).
2. Run `verlon doctor --gate <that-id>` (or
   `npx -y @verlon-ai/cli@latest doctor --gate <that-id>`).
3. Relay each check result. If a check fails, relay the CLI's reason
   and hint verbatim — the messages are written to be actionable (e.g.
   "no sessions yet: restart Claude Code and start a session, then
   re-run").

If there is no `.claude/settings.local.json` with an `ANTHROPIC_MODEL`,
this project isn't connected — point the user at `/verlon:connect`.
