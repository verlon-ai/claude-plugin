---
description: List the models this project can route to via Verlon
allowed-tools: Bash(verlon *), Bash(npx -y @verlon-ai/cli@latest *)
---

Show the user which models their Verlon gate can route to.

Run `verlon models` (or `npx -y @verlon-ai/cli@latest models` if
`verlon` is not installed) and present the output — it lists live model
ids per provider with pricing and capability scores. Mention that
`/verlon:switch <model-id>` applies any of them to this session with no
restart.
