---
description: Check that Claude Code's connection to Verlon is healthy
allowed-tools: Bash(verlon *), Bash(npx -y @verlon-ai/cli@latest *)
---

Check this Claude config's Verlon connection.

1. Run `verlon doctor` (or `npx -y @verlon-ai/cli@latest doctor`). It
   checks the sign-in and network, and, when this config is connected,
   that Claude Code's usage reaches Verlon: sessions recorded, turns
   grouping, costs accruing.
2. Relay each check result. If a check fails, relay the CLI's reason and
   hint verbatim: they say what to do (for example "no sessions yet:
   restart Claude Code and start a session, then re-run").
3. If it says this config isn't connected, point the user at
   `/verlon:connect`.

The output includes identity checks (which account the CLI acts as, and
which account this config's key belongs to): relay those plainly, since
they answer "why did my sessions land in the wrong account". The
dashboard is at https://verlon.ai/dashboard; never cite any other URL.
