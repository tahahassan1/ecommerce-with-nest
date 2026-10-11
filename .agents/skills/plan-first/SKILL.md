---
name: plan-first
description: Use this skill for any non-trivial coding task before writing or editing code — new features, refactors, state/data-flow changes, or anything touching more than one file. Forces an Explore → Plan → Approve → Implement sequence instead of jumping straight into edits. Skip this skill only for single-line fixes, typo corrections, or when the user explicitly says "just do it" / "skip planning". Trigger on phrases like "implement X", "add X", "refactor X", "fix X" (when X is not a one-liner), or any task that touches shared/core modules other parts of the codebase depend on.
---

# Plan First

A fixed pre-flight sequence: read only what's relevant, explore without editing, write a short plan, stop for approval, then implement. This exists to stop scope creep and wasted exploration on tasks that don't need it — not to add ceremony to tasks that do.

## When to skip this skill entirely

Do NOT run this sequence for:
- One-line fixes (typo, single constant, single import)
- Tasks where the user already gave exact file + exact change
- Tasks the user marked urgent/trivial ("just do it", "skip planning")

For these, just do the edit. Running the full sequence on a trivial task is the failure mode this skill exists to prevent, not enable.

For everything else — new features, refactors, anything touching sync/state/cross-module logic — run the sequence below.

## The sequence

### Step 1 — Read AGENTS.md

Read the entire file. If the task also maps to a skill in `.agents/skills/`, note it now — don't load it yet unless Step 2 needs it.

### Step 2 — Explore (read-only, no edits)

Read the current code directly relevant to the task. Hard rule: **no file edits in this step, no exploratory "let me also check X while I'm here."** If you find yourself wanting to open a file that isn't directly on the path to understanding the task, stop and ask instead of wandering.

Explore just enough to answer three questions:
1. What does the current implementation actually do here?
2. What's the smallest set of files this change touches?
3. Is there an existing pattern in the codebase this should follow (a shared base class, a repository/service layer, a naming convention) rather than introducing a new one?

Cost check: if answering these three questions requires opening more than a handful of files, that's a sign the task itself needs to be split smaller, not that more exploration will fix it. Stop and say so instead of continuing to dig.

### Step 3 — Write the plan to `tasks.md`

Overwrite (don't append forever — this file reflects the *current* task, not a running log) `tasks.md` at `docs/tasks/<task-folder>/tasks.md` with exactly this structure, where `<task-folder>` is a short kebab-case name that explains the task (e.g. `docs/tasks/tickets-state-filter/tasks.md`).

- The path is `<project>docs/tasks/<task-folder>/tasks.md` — resolve it from the project root (the folder that contains `AGENTS.md`/`pubspec.yaml`/`package.json`). If a `docs/` folder doesn't exist yet, create it. Do NOT put `tasks.md` directly at the repo root.
- If a `tasks/` folder doesn't exist inside `docs/`, create it. Reuse one folder per task; when a task is done and approved, its folder can be cleaned up — this is not a running log.

```markdown
## Goal
[one line — what "done" means, no implementation detail]

## Files expected to change
- path/to/file — [why]

## Files explicitly off-limits
- path/to/file — [why, if there's a risk the agent might otherwise touch it]

## Acceptance criteria
- [ ] concrete, testable condition
- [ ] existing tests still pass (name them if known)
- [ ] no breaking changes to [specific public API/contract], if relevant

## Approach
[2-4 lines max — the actual technical approach, e.g. "extend the existing X function
with Y handling; no new classes/modules"]

## Verification
[filled in at Step 5 — the exact commands run and their results, plus anything that was
only verified by inspection or not verified at all]
```

Keep the plan (Goal through Approach) under ~25 lines — the `## Verification` block added at Step 5 doesn't count toward that. If the plan is running longer than ~25 lines, the task is too big — say so and propose splitting it instead of writing a longer plan.

### Step 4 — Stop and wait

After writing `docs/tasks/<task-folder>/tasks.md`, stop. Do not proceed to implementation in the same turn. State in one line that the plan is ready for review and wait for explicit approval ("go", "نفذ", "approved", etc.) or corrections.

If corrections come back, edit `tasks.md` in place and stop again. Do not implement partial feedback while still gathering the rest.

### Step 5 — Implement

Only after approval. Implement against `tasks.md` as written — if reality forces a deviation from the plan (an acceptance criterion turns out to be wrong, a file outside the declared scope must change), stop and flag the deviation rather than silently expanding scope. Small deviations get a one-line flag inline; anything that changes the Goal or adds a new file to scope goes back to Step 3.

When done, check off the acceptance criteria against what was actually verified (tests run, not just code written) before reporting completion.

## Efficiency notes

- This sequence is for tasks with real ambiguity or cross-file risk. Using it on a trivial task wastes a full round-trip for nothing — see the skip list above.
- `tasks.md` is scoped to the *current* task only. It is not a project log or backlog. Once a task is implemented and approved, its content is stale — the next task overwrites it.
- Never expand "explore" into a general architecture review unless the task itself is an architecture change. Reading the whole service topology to make a two-line config change is the specific failure this skill prevents.

## Project-relative paths

`docs/` means the `docs/` folder inside the current project root (the folder containing `AGENTS.md`/`pubspec.yaml`/`package.json`), regardless of what the project is called — so this skill stays reusable across projects. Create `docs/` (and `docs/tasks/`) if they don't exist.