---
description: Connect this project to Verlon (one command, then restart)
allowed-tools: Bash(verlon *), Bash(npx -y @verlon-ai/cli@latest *)
---

Connect this project's Claude Code to Verlon. The setup logic is
entirely in the Verlon CLI — run it, then report; never improvise the
setup yourself.

1. Run `verlon connect claude-code`. If `verlon` is not installed, run
   `npx -y @verlon-ai/cli@latest connect claude-code` instead.
2. If it fails with an authentication error, tell the user to run
   `verlon login` in their terminal (it opens a browser), then re-run
   this command.
3. On success, relay the CLI's output faithfully, and finish by telling
   the user clearly: **restart Claude Code now** — the routing settings
   are read at startup, so nothing changes until they restart. After
   restarting, their sessions appear on the Verlon dashboard within
   seconds.

Do not edit .claude/settings.local.json yourself. Do not paste API keys
into the conversation.
