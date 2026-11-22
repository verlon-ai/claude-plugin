---
description: Disconnect Claude Code from Verlon (restores your settings)
allowed-tools: Bash(verlon *), Bash(npx -y @verlon-ai/cli@latest *)
---

Disconnect Claude Code from Verlon. The removal logic is entirely in the
Verlon CLI: run it, then report. Never edit Claude Code's settings
yourself.

1. BEFORE running anything, tell the user this prominently (it must
   reach them even if the rest of this command gets interrupted):
   disconnecting takes effect when the Claude Code process restarts, so
   **this session keeps its current connection until you restart**. A
   new chat is not a restart; in VS Code, reload the window.
2. Run `verlon disconnect`. If `verlon` is not installed, run
   `npx -y @verlon-ai/cli@latest disconnect` instead.
3. If it reports nothing to disconnect, relay that: this Claude config
   isn't connected.
4. On success, relay the CLI's output, including its note (it restores
   the settings, revokes the key connect made, and keeps the usage
   history on the dashboard), and repeat the restart instruction.

The dashboard is at https://verlon.ai/dashboard; never cite any other
URL.
