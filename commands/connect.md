---
description: Connect Claude Code to Verlon (one command, then restart)
allowed-tools: Bash(verlon *), Bash(npx -y @verlon-ai/cli@latest *)
---

Connect Claude Code to Verlon. The setup logic is entirely in the
Verlon CLI: run it, then report. Never improvise the setup yourself.

1. Run `verlon connect claude-code --format table`. If `verlon` is not
   installed, run
   `npx -y @verlon-ai/cli@latest connect claude-code --format table`
   instead.
2. It asks nothing: it uses the account's Claude Code setup (creating it
   on the first connect) and writes Claude Code's user settings for the
   active Claude config. If it opens a browser to approve this machine,
   tell the user to approve it there.
3. The CLI prints the account it is acting as first: relay that line.
   If it warns that an environment key is shadowing a different login,
   relay the warning verbatim and mention that
   `verlon connect claude-code --fresh` connects as the login instead.
4. On success, relay the CLI's output faithfully, including which Claude
   config it connected ("Connected Claude Code (~/.claude)"), and finish
   by telling the user clearly: **restart Claude Code now**. Settings
   are read when the process starts, so a new chat is not a restart; in
   VS Code, reload the window (Developer: Reload Window).

Do not edit Claude Code's settings files yourself. Do not paste API keys
into the conversation. The dashboard is at https://verlon.ai/dashboard;
never cite any other URL.
