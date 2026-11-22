# Verlon plugin for Claude Code

Connect Claude Code to [Verlon](https://verlon.ai): its sessions, turns,
tools and costs show on your dashboard, and `/verlon:switch on` moves it
to any model through Verlon, with no restart.

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

Then run:

```
/verlon:connect
```

…and restart Claude Code. Settings are read at process start, so a new
chat is not a restart; in VS Code, reload the window. Connect asks
nothing: it uses your account's Claude Code setup and writes Claude
Code's user settings for the active Claude config (never anything inside
a repository). Your sessions then appear on the dashboard within seconds.

## Commands

| Command | What it does |
| --- | --- |
| `/verlon:connect` | Connect Claude Code to Verlon, then restart |
| `/verlon:switch on` / `off` | Move Claude Code to Verlon, or back to your Claude plan; takes effect next message, no restart |
| `/verlon:switch <model>` | Pick the model this repository (or folder) runs on through Verlon |
| `/verlon:models` | List the models, with live pricing and capability scores |
| `/verlon:doctor` | Check the connection: sessions, turns and costs reaching Verlon, and which account everything belongs to |
| `/verlon:disconnect` | Restore Claude Code's settings and revoke the key connect made, then restart |

The plugin also ships a session-start guard: if a session is still
routing through Verlon after a disconnect (env vars are process-held —
a new chat is not a restart), it warns automatically until the process
actually restarts.

The plugin also bundles the Verlon MCP server, so you can simply ask —
"switch my model to gpt-4o", "how much did this session cost?" — and
Claude will use the Verlon tools. The slash commands remain the
deterministic path.

## Design

All setup and switching logic lives in `@verlon-ai/cli`: the plugin
narrates and never improvises.

On your Claude plan, Claude Code keeps talking to Anthropic, and Verlon
receives Claude Code's standard usage telemetry only (tokens, cost,
models, tool names and timings, session ids; never your code or
prompts). On Verlon, requests pass through Verlon to the model provider,
and every call is billed to your Verlon credit, including the calls
Claude Code makes in the background.
