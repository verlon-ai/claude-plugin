# Verlon plugin for Claude Code

Route Claude Code through [Verlon](https://verlon.ai) — any model
behind one gate, hot-swappable mid-session, with usage, cost, and cache
insights on your dashboard.

## Before installing

You need Node.js on the machine (the plugin's commands run the Verlon
CLI via `npx`). Check with `node --version`; install via
`brew install node` (macOS) or `winget install OpenJS.NodeJS.LTS`
(Windows) if missing.

## Install

**Slash commands** — open Claude Code and run these **one at a time**
(the first registers Verlon's plugin source on your machine — nothing
is published anywhere; the second installs the plugin from it):

```
/plugin marketplace add https://github.com/verlon-ai/claude-plugin
```

```
/plugin install verlon
```

**Or point-and-click (VS Code panel users)** — type `/plugins` in the
prompt box to open the Manage plugins interface, add
`https://github.com/verlon-ai/claude-plugin` under Marketplaces, then
find **verlon** in the plugin list and click Install. No terminal
needed.

Then open Claude Code **in the project you want to connect** (the
settings are written into the current project) and run:

```
/verlon:connect
```

…and restart Claude Code — settings are read at process start, so a new
chat is not a restart; in VS Code, reload the window. Your sessions
then appear on the dashboard within seconds.

## Commands

| Command | What it does |
| --- | --- |
| `/verlon:connect [gate-id]` | One-command setup: gate + key + settings, then verify |
| `/verlon:switch <model>` | Route this session to another model — takes effect next turn, no restart |
| `/verlon:models` | List routable models with live pricing + capability scores |
| `/verlon:doctor` | Verify the connection: traffic, sessions, costs — and which account everything belongs to |
| `/verlon:disconnect` | Remove what connect wrote, then restart to take effect |

The plugin also ships a session-start guard: if a session is still
routing through Verlon after a disconnect (env vars are process-held —
a new chat is not a restart), it warns automatically until the process
actually restarts.

The plugin also bundles the Verlon MCP server, so you can simply ask —
"switch my model to gpt-4o", "how much did this session cost?" — and
Claude will use the Verlon tools. The slash commands remain the
deterministic path.

## Design

All setup and switching logic lives in `@verlon-ai/cli` — the plugin
narrates and never improvises. Model routing is resolved server-side
per request (the gate), which is what makes mid-session switching and
dashboard-driven swaps possible with zero client changes.

Telemetry: `/verlon:connect` enables Claude Code's standard usage
telemetry (metadata only — tokens, cost, tool timings; your code and
prompts are not included) pointed at your own Verlon account. Remove
the `OTEL_*` lines from `.claude/settings.local.json` to turn it off.
