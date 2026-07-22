---
name: codex-review
description: >-
  Run an independent code review with Codex (gpt-5.6-sol) over the current repo's
  changes and surface the findings. Use when the user says /codex-review, asks
  for a codex review, or wants a second (non-Claude) pair of eyes on a diff,
  branch, or commit before shipping.
disable-model-invocation: true
---

# codex-review

`/codex-review [target]` runs `codex review` (gpt-5.6-sol, via the local Codex CLI) against the
current git repository and reports the findings verbatim, then a short synthesis. This is the
manual counterpart to the `reviewer` agent's automatic codex pass — reach for it when you want
an independent perspective without a full review dispatch.

## Preconditions

1. Must be inside a **git repository** (`git rev-parse --is-inside-work-tree`). If not, stop and say so — there is nothing to review.
2. `codex` must be on PATH (`which codex`). If missing, tell the user to install/authenticate the Codex CLI; do not fabricate findings.

## Choosing what to review

Map the `[target]` argument (if any) to a `codex review` invocation. Default = uncommitted working-tree changes.

| Intent / argument | Command |
|---|---|
| default / "working tree" / "my changes" | `codex review --uncommitted` |
| a branch, or "vs main" / "this branch" | `codex review --base <base-branch>` (e.g. `main`) |
| a specific commit SHA | `codex review --commit <sha>` |
| custom focus (e.g. "just the SQL") | append the instruction as the prompt arg: `codex review --uncommitted "focus on the SQL changes"` |

`codex review` is non-interactive and uses the Codex config default model (`gpt-5.6-sol`). To force a model, add `-c model="<name>"`.

## Steps

1. Verify preconditions above.
2. Determine the target (from the argument, else default to `--uncommitted`; if the user is clearly reviewing a feature branch, use `--base main`).
3. Run the chosen `codex review` command via Bash from the repo root. It streams its own findings.
4. Relay the findings **verbatim**, then add a 2-4 line synthesis: what's most severe, what (if anything) blocks shipping, quick wins.
5. Do not edit code or commit — this skill only reviews. If the user wants fixes applied, hand off to the `implementer` or make the edits in a separate, explicit step.

## Notes

- Findings are gpt-5.6-sol's opinion — weigh them, don't apply blindly. Cross-check anything that contradicts the repo's `AGENTS.md` conventions.
- For a merged Claude + codex review in one shot, dispatch the `reviewer` agent instead; use this skill when you specifically want the raw codex pass.
