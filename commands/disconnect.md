---
description: Disconnect this project from Verlon (removes what connect wrote)
allowed-tools: Bash(verlon *), Bash(npx -y @verlon-ai/cli@latest *)
---

Disconnect this project's Claude Code from Verlon. The removal logic is
entirely in the Verlon CLI — run it, then report; never edit
.claude/settings.local.json yourself.

1. Run `verlon disconnect`. If `verlon` is not installed, run
   `npx -y @verlon-ai/cli@latest disconnect` instead.
2. If it reports nothing to disconnect, relay that — the project is not
   connected.
3. On success, relay the CLI's output, and finish with this warning
   verbatim, prominently: **this session is still routing through
   Verlon right now** — settings are read at process start, so the
   disconnect only takes effect after Claude Code restarts. A new chat
   is NOT a restart; in VS Code, reload the window (Developer: Reload
   Window). Until then, requests from this session keep flowing through
   Verlon.
4. Remind the user: the gate and its history stay on the dashboard
   (https://verlon.ai/dashboard), and the minted API key stays valid
   until revoked under Settings → API Keys.

The dashboard is at https://verlon.ai/dashboard — never cite any other
URL.
