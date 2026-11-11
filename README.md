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

Then run, from any folder:

```
/verlon:connect
```

…and restart Claude Code once, so its telemetry starts (in VS Code,
reload the window). Connect changes only your own Claude Code settings
(`~/.claude/settings.json`, backed up first), never a file in any
repository, and `/verlon:disconnect` puts them back exactly.

## Commands

| Command | What it does |
| --- | --- |
| `/verlon:connect [gate-id]` | One-command setup, once per machine |
| `/verlon:switch on` / `off` | Move between Verlon and your Claude subscription, live: every running session follows from its next message |
| `/verlon:switch` | Where requests go now |
| `/verlon:model use <model-or-category>` | Choose what this repository runs on through Verlon (`--all` for every repository) |
| `/verlon:models` | List the models, with live pricing and capability scores |
| `/verlon:doctor` | Verify the connection, and which account everything belongs to |
| `/verlon:disconnect` | Back to your Claude subscription, settings restored |

While switched on, `/model` shows Verlon's rows: "Verlon: this repo's
pick", your categories and the models your choices name.

The plugin also bundles the Verlon MCP server, so you can simply ask —
"switch my model to gpt-4o", "how much did this session cost?" — and
Claude will use the Verlon tools. The slash commands remain the
deterministic path.

## Design

All setup and switching logic lives in `@verlon-ai/cli`: the plugin
narrates and never improvises. Choices live on Verlon, keyed by
repository, and apply at request time.

Telemetry: connect turns on Claude Code's standard usage telemetry
(metadata only: tokens, cost, tool timings; your code and prompts are
not included), sent to your own Verlon account. `/verlon:disconnect`
removes it.
