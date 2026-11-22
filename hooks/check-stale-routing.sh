#!/bin/sh
# Stale-routing guard: env vars are read at process start, so a session
# can keep routing through Verlon after `verlon disconnect` removed the
# settings (a new chat is not a restart). This fires on SessionStart —
# including new chats, /clear, and post-compaction in the same process —
# and warns until the process actually restarts.
#
# Not stale (exit silently) when: this session isn't routed through
# Verlon at all, or the settings on disk still carry this connection
# (this session's Verlon base URL): the active Claude config's user
# settings (CLAUDE_CONFIG_DIR, else ~/.claude), where connect writes, or
# an older connect's project file. A base URL of the user's own, which
# disconnect restores, is not this connection.

case "${ANTHROPIC_BASE_URL:-}" in
  *verlon.ai*) ;;
  *) exit 0 ;;
esac

for settings in "${CLAUDE_CONFIG_DIR:-$HOME/.claude}/settings.json" "${CLAUDE_PROJECT_DIR:-.}/.claude/settings.local.json"; do
  if [ -f "$settings" ] && grep -qF "\"$ANTHROPIC_BASE_URL\"" "$settings" 2>/dev/null; then
    exit 0
  fi
done

cat <<'EOF'
{
  "hookSpecificOutput": {
    "hookEventName": "SessionStart",
    "additionalContext": "IMPORTANT — tell the user this prominently at your first opportunity: Claude Code was disconnected from Verlon, but THIS session is still routing through Verlon because environment variables are read at process start and this process predates the disconnect. A new chat is not a restart. To finish disconnecting, restart Claude Code — in VS Code, reload the window (Developer: Reload Window); in a terminal, exit and re-run claude. Until then, requests from this session keep flowing through Verlon."
  }
}
EOF
exit 0
