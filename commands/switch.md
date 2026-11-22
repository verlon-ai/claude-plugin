---
description: Move Claude Code between your Claude plan and Verlon, or pick the model it runs on through Verlon
argument-hint: on | off | <model-id>
allowed-tools: Bash(verlon *), Bash(npx -y @verlon-ai/cli@latest *)
---

The switching logic lives entirely in the CLI: never edit settings files
or call APIs directly. If `verlon` is not installed, use
`npx -y @verlon-ai/cli@latest` with the same arguments.

- **`on` or `off`:** run `verlon switch $ARGUMENTS`. `on` sends Claude
  Code's requests through Verlon on the user's Verlon credit; `off`
  goes back to their Claude plan. It takes effect on the next message,
  with no restart. Relay the CLI's lines, including the one about
  background calls being billed on Verlon. If the CLI stops and offers a
  choice (`switch off --anyway` when a running session is on a
  Verlon-only model, `switch on --now` when a long conversation would
  compact first), relay it and let the user decide; don't add the flag
  yourself.
- **No argument:** run `verlon switch` and relay where this config's
  requests go now.
- **A model id:** run `verlon model use $ARGUMENTS`. It sets the model
  this repository (outside a repository, this folder) runs on through
  Verlon. If the CLI says the model is
  unknown, run `verlon models` and show the user the ids so they can
  pick one. If this config is on the Claude plan, tell them the model
  applies once they run `/verlon:switch on`.

The dashboard is at https://verlon.ai/dashboard; never cite any other
URL.
