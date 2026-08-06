# Verlon plugin for Claude Code

Route Claude Code through [Verlon](https://verlon.ai) — any model
behind one gate, hot-swappable mid-session, with usage, cost, and cache
insights on your dashboard.

## Install

Open Claude Code and run these **one at a time** (the first registers
Verlon's plugin source on your machine — nothing is published anywhere;
the second installs the plugin from it):

```
/plugin marketplace add https://github.com/verlon-ai/claude-plugin
```

```
/plugin install verlon
```

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
