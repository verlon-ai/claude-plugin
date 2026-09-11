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
2. Running from here is non-interactive, so the CLI resolves the gate
   deterministically: the project's currently connected gate, else the
   user's default gate, else a sole existing gate, else it creates the
   first one. It never guesses between gates: with several gates and no
   default it exits with code `ambiguous_gate`. When that happens, run
   `verlon gate list`, show the user their claude-code gates in chat
   (name, model, id — one per line), ask which to use — offering
   "create a new one" as an option (`verlon connect claude-code`
   creates one only when none exist; to create an additional gate,
   point the user to the dashboard's New Claude Code gate button) —
   then re-run `verlon connect claude-code --gate <their pick>`. If
   they'd like that gate used for future connects too, mention
   `verlon gate set-default <id>`.
3. The CLI prints the account it is acting as first — relay that line.
   If it warns that an environment key is shadowing a different login,
   relay the warning verbatim and mention
   `verlon connect claude-code --fresh` reconnects as the login
   identity instead.
4. If it fails with an authentication error, tell the user to run
   `verlon login` in their terminal (it opens a browser), then re-run
   this command.
5. On success, relay the CLI's output faithfully, and finish by telling
   the user clearly: **restart Claude Code now** — settings are read at
   process start, a new chat is NOT a restart, and in VS Code that
   means reloading the window (Developer: Reload Window). After
   restarting, their sessions appear on the Verlon dashboard within
   seconds.

Do not edit .claude/settings.local.json yourself. Do not paste API keys
into the conversation. The dashboard is at
https://verlon.ai/dashboard — never cite any other URL.
