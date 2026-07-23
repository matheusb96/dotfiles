---
name: forensics
description: >-
  Reconstruct a record's timeline from a project's PRODUCTION database to debug
  what happened — e.g. a support/chat conversation, an order, a user's session:
  the messages/events/actions interleaved chronologically. Use when the user
  says /forensics or wants to debug a specific production record. The agent
  WRITES a read-only query; the USER runs it on prod and pastes the output back
  for interpretation. Project-agnostic: the schema comes from the project.
disable-model-invocation: true
---

# forensics

`/forensics <identifier>` debugs a real production record by reconstructing its timeline. This skill is the **method**; the **schema is per-project**. The agent never touches production — it authors a read-only query, the user runs it, the agent interprets.

## Access model (universal, non-negotiable)

- **No prod access from the agent.** It authors the query; the user runs it on prod (console or SQL client) and pastes results back.
- **Read-only only.** Never write, mutate, migrate, or reset. If a fix is warranted, hand off to `implementer` afterward.
- **Respect encryption.** If the project encrypts the fields you need (message bodies, PII), raw SQL shows ciphertext — emit a **console/ORM** query that decrypts instead. Otherwise SQL is fine.
- **Scope to the tenant/record.** Never dump broad tables; filter to the one identifier.

## Step 1 — get the project's schema binding

Look for the project's forensics schema, in order:
1. `docs/agents/forensics.md` in the repo (preferred — the per-project binding).
2. A "forensics"/timeline section in the repo `AGENTS.md`/`CLAUDE.md`.
3. **If none exists:** dispatch the `investigator` agent to map it — how an identifier (id / phone / email / uuid) resolves to the record, then to its ordered timeline (messages, events, actions, status changes, outcome), and **which fields are encrypted**. Then offer to save that map to `docs/agents/forensics.md` so it's a one-time cost (the user commits it).

## Step 2 — emit the read-only query

Using the binding, produce a ready-to-paste query filling in the identifier:
- Encrypted fields needed → an **ORM/console script** (decrypts) as the primary path.
- Plaintext-only need → a **SQL** query for the user's DB client.
- Interleave the timeline chronologically; tag each row by source (inbound/outbound/event/action). Filter out placeholder/noise rows the binding names.

## Step 3 — interpret the pasted output

Reconstruct plainly (in the project's language/locale):
1. **What the actor wanted** — from their inputs / classified intent.
2. **What the system did** — responses, actions/tools invoked (+ failures), state changes.
3. **Where it went wrong** — the specific step: misclassification, failed action, wrong response, missed escalation, stale data.
4. **Verdict + next step** — real bug → `planner`/`implementer`; data/config issue → say so.

Keep it a tight timeline read, not a dump. If the paste is truncated or a field is empty, say what else to pull rather than guessing.

## Notes

- New project with no binding yet → Step 1.3 builds it once; every later run is instant.
- The binding owns all project specifics (table/column names, identifier format, encryption, noise filters). This file stays project-agnostic.
