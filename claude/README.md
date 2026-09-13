# Claude Code setup

Harness-specific pieces for `~/.claude`. The standing brief and custom skills are
harness-neutral and live in `../agents/` — see the root README for the full install.

```
settings.json    model, hooks, statusline, enabled plugins/marketplaces
hooks/           caveman mode: activate, mode-tracker, stats, statusline
```

Hook paths in `settings.json` use `$CLAUDE_CONFIG_DIR`; if the harness doesn't expand it, replace with the absolute `~/.claude` path on that machine.

Plugins (`caveman`, `impeccable`, `stripe`, lsp) install from the marketplaces declared in `settings.json`.
