#!/bin/sh
# Stale-routing guard: env vars are read at process start, so a session
# can keep routing through Verlon after `verlon disconnect` removed the
# settings (a new chat is not a restart). This fires on SessionStart —
# including new chats, /clear, and post-compaction in the same process —
# and warns until the process actually restarts.
#
# Not stale (exit silently) when: this session isn't routed through
# Verlon at all, or the settings on disk still carry the connection
# (project or --global scope).

case "${ANTHROPIC_BASE_URL:-}" in
  *verlon.ai*) ;;
  *) exit 0 ;;
esac

for settings in "${CLAUDE_PROJECT_DIR:-.}/.claude/settings.local.json" "$HOME/.claude/settings.json"; do
  if [ -f "$settings" ] && grep -q 'ANTHROPIC_BASE_URL' "$settings" 2>/dev/null; then
    exit 0
  fi
done

cat <<'EOF'
{
  "hookSpecificOutput": {
    "hookEventName": "SessionStart",
    "additionalContext": "IMPORTANT — tell the user this prominently at your first opportunity: this project was disconnected from Verlon, but THIS session is still routing through Verlon because environment variables are read at process start and this process predates the disconnect. A new chat is not a restart. To finish disconnecting, restart Claude Code — in VS Code, reload the window (Developer: Reload Window); in a terminal, exit and re-run claude. Until then, requests from this session keep flowing through Verlon."
  }
}
EOF
exit 0
