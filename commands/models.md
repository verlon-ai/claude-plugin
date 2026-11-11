---
description: List the models Claude Code can run on through Verlon
allowed-tools: Bash(verlon *), Bash(npx -y @verlon-ai/cli@latest *)
---

Show the user which models they can run Claude Code on through Verlon.

Run `verlon models` (or `npx -y @verlon-ai/cli@latest models` if
`verlon` is not installed) and present the output: live model ids per
provider, with pricing and capability scores. Mention that
`/verlon:model use <model-id>` makes one this repository's choice, and
`verlon model categories` lists the categories.
