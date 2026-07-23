# Claude Code setup

Portable scaffolding for `~/.claude` — standing brief, subagent roster, custom skills, caveman hooks, settings.

```
CLAUDE.md        standing brief — working style, hard rules, model routing, orchestration
settings.json    model, hooks, statusline, enabled plugins/marketplaces
agents/          planner · implementer · reviewer · investigator · advisor
skills/          codex-review · forensics · kickoff · no-mistakes
hooks/           caveman mode: activate, mode-tracker, stats, statusline
```

## Install

```sh
ln -sf  "$PWD/claude/CLAUDE.md"     ~/.claude/CLAUDE.md
ln -sf  "$PWD/claude/settings.json" ~/.claude/settings.json
ln -sfn "$PWD/claude/agents"        ~/.claude/agents
ln -sfn "$PWD/claude/hooks"         ~/.claude/hooks
mkdir -p ~/.claude/skills
for s in codex-review forensics kickoff no-mistakes; do
  ln -sfn "$PWD/claude/skills/$s" ~/.claude/skills/$s
done
```

Hook paths in `settings.json` use `$CLAUDE_CONFIG_DIR`; if the harness doesn't expand it, replace with the absolute `~/.claude` path on that machine.

## Not included

- Third-party skills (`tdd`, `diagnose`, `handoff`, `triage`, `to-prd`, …) live in `~/.agents/skills` and are symlinked into `~/.claude/skills`.
- Plugins (`caveman`, `impeccable`, `stripe`, lsp) install from the marketplaces declared in `settings.json`.
