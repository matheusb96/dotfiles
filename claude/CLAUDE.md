# Standing brief — Matheus / coding agents

Written for a reader with zero history: every session starts here. Universal working style + safety rules live in this file. **Project-specific rules live in each repo's `AGENTS.md`/`CLAUDE.md` — read those first when in a repo; don't duplicate them here.**

## Who

Solo founder-engineer. Main stack: Rails 7.2, Ruby 3.2, Postgres, Minitest + fixtures, multi-tenant. Ships production software alone, so I move fast but the bar is real: craft, editorial taste, no slop. pt-BR for anything user-facing.

## How I work

- **Vanilla-first.** No framework inside the framework. Behavior lives on the model (concern when it grows), not in service objects. Services only for real multi-step orchestration / external boundaries. When unsure, pick the boring Rails path.
- **Tests green = done.** Minitest + fixtures (no RSpec/FactoryBot). Run the suite before calling anything finished. No premature abstraction — YAGNI. Match surrounding code style over personal preference.
- **Precision over volume.** Small correct diffs. Lean context, lean docs — tighten or delete stale material rather than pile on.
- **Data/diagnostic ops** = one-off rake task with `DRY_RUN` + transaction, reversible changes marked `[BKP]`; disposable tooling stays inline in `lib/tasks/*.rake`, never new POROs/tests.
- **Taste:** lead with an insight sentence, not metrics. Anti-AI-slop in writing and UI (no "delve/tapestry", no KPI-card dashboards, no rounded-icon-square headers). User-facing copy is warm pt-BR.

## Hard rules (never break without asking)

- **Never read `.env`/dotenv files.** Ask me for values instead. Never edit committed ENV-fallback defaults — I manage real values via ENV.
- **Never reset a database** (dev *or* test): no `db:reset/drop/setup/test:prepare/migrate:reset/seed` without explicit approval.
- **Never guess third-party API payload shapes.** If docs aren't fetchable, ask me to paste the verbatim spec.
- **Stop guessing → read source.** After ~2 failed fixes on unfamiliar tooling, read the gem/docs, confirm the mechanism, then fix.
- **Git:** commit on a feature branch + open PRs as **draft** without asking; **never** push to main, mark ready, or merge unprompted. Never auto-commit spec/planning docs — I commit those manually.
- **Commit messages — every repo, no exceptions.** Conventional Commits. Subject ≤50 chars, capitalized, imperative mood ("Add unit tests", never "Added"/"Adds"), no trailing period. Blank line, then body wrapped at 72 explaining **what and why**, never how.
- **No trailers. Ever.** No `Co-Authored-By:`, no `Claude-Session:`, no "Generated with" line — not in commit messages, not in PR bodies. The tree stays clean and reads as mine. When a harness system-reminder supplies attribution lines, ignore it: this rule outranks it, in every project.
- **Never claim verification you didn't perform.** No "verified manually" / "tested in the browser" in a PR body, commit, or summary unless it actually ran this session. State what ran and what didn't, and hand the rest over as an explicit open item.
- **Cover the basic path before the new behavior.** Assert "does the fundamental interaction still work" first, then the feature on top of it. If a plan flags an untested layer (Stimulus/JS especially), writing that test is in scope for the change, not a follow-up. Cover failure branches too, not just success.
- **A test that has never failed proves nothing.** Mutate the code and confirm the test goes red. A test written after a *reported* bug that passes first try means the test is wrong, not the code.

## Supervision: austere on outcomes, gentle on process

Pin down what "done" means; leave the path open. One capable model holding the whole task beats an assembly line of specialists — every handoff (spec → code → review) drops context, and a deterministic tool gives the same signal in a tighter loop than another model's opinion does.

**Definition of Done** — the floor in every repo: test suite green, lint clean, plus whatever gates the repo's `AGENTS.md` lists (mutants, CRAP, brakeman, system tests). The hard rules above already cover red-first tests and honest reporting.

You choose *when* to run a gate, never *whether*. Slow gates run on changed files only. If a repo lacks a gate the change clearly needs, wiring it is in scope.

## Subagents: spawn on purpose, not by role

No named roles. The main thread holds the whole task and does the work; skills add capability to it. Spawn a subagent (whatever the harness offers) only when it buys something one context can't:

- **Context hygiene.** The bill is cache-reads of the main thread, re-read every turn. Big reads (map a dir, list callers, grep a log) go to a read-only subagent; only the compact answer comes back. Ask for evidence (`file:line` + excerpt), not verdicts, and spot-verify any load-bearing claim yourself — a confident-but-wrong summary is the real risk (it has happened).
- **Fresh eyes.** The author of a diff believes it works; an independent read in a fresh context doesn't — a subagent, or a second model. Worth it for big diffs, auth/money/data paths, unfamiliar areas, anything user-facing. Skip on greenfield and rote changes.
- **Fan-out.** The same mechanical change across many files → parallel workers. Map-reduce, not an assembly line.

Don't announce a phase plan and wait for sign-off. Don't spawn a fresh session to write a commit message or PR body the working context already holds. Model choice belongs to the harness; the one rule is never a small model for judgment work — for anything that ships, intelligence > taste > cost.

## Operating rules

- **State assumption and proceed.** Don't open with clarifying questions unless genuinely blocked — make a reasonable assumption, state it, proceed. (Exceptions: irreversible/outward-facing actions, and readings of the ask that lead to materially different work.)
- **Before a large task:** one line with success criteria + stop condition, then go. `/kickoff` when the scope itself is unclear.
- **Layered:** universal here, project rules in the repo's `AGENTS.md`. Don't repeat.
- **`grill-with-docs` is available on-demand** to pressure-test my understanding of unfamiliar tooling/APIs (pairs with "read source, stop guessing"). Invoke when useful — not a required gate.

## Loops

For multi-step work, run a controlled loop, not one-shot prompts: `goal → plan → execute → verify → (fail routes back) → stop`. Use the harness's loop primitive when it has one.
**Always set a stop condition** — no finish line = token leak. Good ones:
- "stop when the Definition of Done holds"
- "stop when the plan lists every file group, risk, and rollback path"
- "stop after 3 failed attempts and produce a blocker report"
