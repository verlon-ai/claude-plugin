---
description: Connect this project to Verlon (one command, then restart)
argument-hint: [gate-id]
allowed-tools: Bash(verlon *), Bash(npx -y @verlon-ai/cli@latest *)
---

Connect this project's Claude Code to Verlon. The setup logic is
entirely in the Verlon CLI — run it, then report; never improvise the
setup yourself.

1. Run `verlon connect claude-code`. If the user passed an argument,
   treat it as a gate id and run
   `verlon connect claude-code --gate $ARGUMENTS` instead. If `verlon`
   is not installed, use `npx -y @verlon-ai/cli@latest` with the same
   arguments.
2. The CLI prints the account it is acting as first — relay that line.
   If it warns that an environment key is shadowing a different login,
   relay the warning verbatim and mention
   `verlon connect claude-code --fresh` reconnects as the login
   identity instead.
3. If it fails with an authentication error, tell the user to run
   `verlon login` in their terminal (it opens a browser), then re-run
   this command.
4. On success, relay the CLI's output faithfully, and finish by telling
   the user clearly: **restart Claude Code now** — settings are read at
   process start, a new chat is NOT a restart, and in VS Code that
   means reloading the window (Developer: Reload Window). After
   restarting, their sessions appear on the Verlon dashboard within
   seconds.

Do not edit .claude/settings.local.json yourself. Do not paste API keys
into the conversation. The dashboard is at
https://verlon.ai/dashboard — never cite any other URL.
