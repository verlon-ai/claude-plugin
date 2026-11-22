---
description: Disconnect Claude Code from Verlon (restores your settings)
allowed-tools: Bash(verlon *), Bash(npx -y @verlon-ai/cli@latest *)
---

Disconnect Claude Code from Verlon. The removal logic is entirely in the
Verlon CLI: run it, then report. Never edit Claude Code's settings
yourself.

1. BEFORE running anything, tell the user this prominently (it must
   reach them even if the rest of this command gets interrupted):
   disconnecting removes Verlon from Claude Code's settings and revokes
   the key this session uses, so **this session stops going through
   Verlon from its next message**. It carries on with their own Claude
   login if they have one (a Claude plan or an API key); if they don't,
   they need to run `/login`. Then restart Claude Code so everything
   starts clean: a new chat is not a restart; in VS Code, reload the
   window.
2. Run `verlon disconnect --format table`. If `verlon` is not installed,
   run `npx -y @verlon-ai/cli@latest disconnect --format table` instead.
3. If it reports nothing to disconnect, relay that: this Claude config
   isn't connected.
4. On success, relay the CLI's output, including its note (it restores
   the settings, revokes the key connect made, and keeps the usage
   history on the dashboard), and repeat the `/login` and restart
   instruction. If this session's reply fails with "Not logged in",
   that is the disconnect taking effect: the user runs `/login`.

The dashboard is at https://verlon.ai/dashboard; never cite any other
URL.
