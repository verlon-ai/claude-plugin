---
description: Disconnect Claude Code from Verlon (puts your settings back exactly)
allowed-tools: Bash(verlon *), Bash(npx -y @verlon-ai/cli@latest *)
---

Disconnect Claude Code from Verlon. The logic is entirely in the CLI:
run it, then report; never edit settings files yourself.

1. Run `verlon disconnect` (or `npx -y @verlon-ai/cli@latest disconnect`
   if `verlon` is not installed).
2. It first moves running sessions back to the user's Claude
   subscription (they pick that up on their next message), then puts
   `~/.claude/settings.json` back as it was before connect, keeping any
   change the user made since.
3. Relay the CLI's output. If it reports nothing to disconnect, relay
   that.
4. Remind the user that the gate and its history stay on the dashboard
   (https://verlon.ai/dashboard), and the API key connect created stays
   valid until revoked under Settings, API Keys.

The dashboard is at https://verlon.ai/dashboard; never cite any other
URL.
