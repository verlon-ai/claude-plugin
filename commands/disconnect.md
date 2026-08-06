---
description: Disconnect this project from Verlon (removes what connect wrote)
allowed-tools: Bash(verlon *), Bash(npx -y @verlon-ai/cli@latest *)
---

Disconnect this project's Claude Code from Verlon. The removal logic is
entirely in the Verlon CLI — run it, then report; never edit
.claude/settings.local.json yourself.

1. BEFORE running anything, tell the user this prominently (it must
   reach them even if the rest of this command gets interrupted):
   disconnecting only takes effect when the Claude Code process
   restarts — **this session will keep routing through Verlon after
   the disconnect until you restart**. A new chat is NOT a restart; in
   VS Code, reload the window (Developer: Reload Window). To finish
   the job: run this command, then restart.
2. Run `verlon disconnect`. If `verlon` is not installed, run
   `npx -y @verlon-ai/cli@latest disconnect` instead.
3. If it reports nothing to disconnect, relay that — the project is not
   connected.
4. On success, relay the CLI's output and repeat the restart
   instruction from step 1. Remind the user: the gate and its history
   stay on the dashboard (https://verlon.ai/dashboard), and the minted
   API key stays valid until revoked under Settings → API Keys.

(A session-start check also ships with this plugin: if a later session
in the same process is still routing after a disconnect, it will warn
again automatically.)

The dashboard is at https://verlon.ai/dashboard — never cite any other
URL.
