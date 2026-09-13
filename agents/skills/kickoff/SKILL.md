---
name: kickoff
description: >-
  Structure a large task (migration, refactor, complex feature build) before
  any code is written, so it doesn't become expensive chaos. Use when the user
  says /kickoff, or is about to start a big multi-file/multi-step job and wants
  scope, routing, and a definition of done nailed down first.
disable-model-invocation: true
---

# kickoff

`/kickoff <big task>` turns a large, vague job into a structured brief **before execution** — goal, scope, constraints, plan-first, and a definition of done. It is the antidote to "refactor this" → expensive chaos. Plan first, execute after approval.

## When to use

Big or risky work: codebase-wide migrations, large refactors, complex product builds, multi-step debugging with many constraints. Not for small scoped edits (just do them).

## Produce this brief

Fill every section. Read the relevant files/docs first (`AGENTS.md`, `CONTEXT.md`, ADRs) so scope and constraints are real, not guessed.

```markdown
# Task: <migration / refactor / build name>

## Goal
<one sentence describing the final state>

## Scope
- In scope: <files, folders, systems>
- Out of scope: <what must NOT change>

## Constraints
- Keep tests passing
- Preserve public APIs unless listed
- Match existing code style (behavior on models, vanilla Rails, pt-BR)
- No .env reads, no DB reset, no push to main

## Plan first
Map the full plan before editing. List the files expected to touch, the risks,
and the unknowns. **Wait for approval before executing.**

## Definition of done
- [ ] Tests pass (name the command)
- [ ] Changed files summarized
- [ ] Risks documented
- [ ] Rollback path included if needed

## Stop condition
<e.g. "stop when tests pass and lint is clean" / "stop after 3 fails → blocker report">
```

## Then

1. Present the brief. **Do not edit anything yet** — get approval on scope + plan.
2. On approval, run the loop chunk by chunk against the definition of done. Spawn subagents only for what the brief allows (big reads, fresh-eyes review, fan-out) — no specifier → coder → reviewer relay.
3. Hold to the stop condition. If blocked, produce the blocker report instead of grinding.
