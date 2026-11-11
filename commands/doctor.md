---
description: Verify the Verlon connection is healthy end-to-end
allowed-tools: Bash(verlon *), Bash(npx -y @verlon-ai/cli@latest *)
---

Verify the Verlon connection: traffic arriving, sessions grouping,
costs accruing.

1. Run `verlon --format table doctor` (or `npx -y @verlon-ai/cli@latest --format table doctor`). It
   reads the connection from the user's Claude Code settings.
2. Relay each check. If one fails, relay the CLI's reason and hint
   verbatim.
3. If it says Claude Code isn't connected, point the user at
   `/verlon:connect`.

The output includes identity checks (acting account, login shadowing,
which account the key belongs to): relay those plainly. The dashboard
is at https://verlon.ai/dashboard; never cite any other URL.
