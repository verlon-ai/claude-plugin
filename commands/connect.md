---
description: Connect Claude Code to Verlon (one command, set up once)
argument-hint: [gate-id]
allowed-tools: Bash(verlon *), Bash(npx -y @verlon-ai/cli@latest *)
---

Connect Claude Code to Verlon. The setup logic is entirely in the
Verlon CLI: run it, then report; never improvise the setup yourself.

1. Run `verlon --format table connect claude-code` (with `--gate $ARGUMENTS` if the
   user passed a gate id). If `verlon` is not installed, use
   `npx -y @verlon-ai/cli@latest` with the same arguments.
2. Connect changes only the user's own Claude Code settings
   (`~/.claude/settings.json`, backed up first), never a file in any
   repository. Say so if the user asks.
3. Without a Verlon login, the CLI starts the browser approval itself
   and prints a code: relay the URL and code, and tell the user to
   approve in the browser. It continues on its own.
4. If it says there are several claude-code gates and no default,
   run `verlon --format table gate list`, show the user's claude-code gates (name,
   model, id, one per line), ask which to use, then re-run with
   `--gate <their pick>`. `verlon --format table gate set-default <id>` makes it the
   default for future connects.
5. The CLI prints the account it acts as first: relay that line, and
   any warning about an environment key verbatim.
6. On success, relay the output, then tell the user to **restart Claude
   Code once** so telemetry starts (in VS Code: Developer: Reload
   Window). After that, `/verlon:switch on` and `off` work live, with
   no restart.

Never paste API keys into the conversation. The dashboard is at
https://verlon.ai/dashboard; never cite any other URL.
