# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

This repo **is** a Claude Code Skill — not an app that uses one. The deliverable is the `dont-git-afraid/` folder, which users copy into their own `.claude/skills/` (project-local) or `~/.claude/skills/` (global). There's no build, no tests, no package manager — editing the markdown files **is** the development loop.

## Repository layout

```
.
├── README.md           ← marketing / overview (Korean)
├── INSTALL.md          ← end-user install instructions
└── dont-git-afraid/    ← the skill itself (this is what gets distributed)
    ├── SKILL.md        ← main skill definition (frontmatter + behavior rules)
    ├── git-status.sh   ← bash script the skill invokes to gather repo state
    ├── conflict-guide.md
    ├── deploy-guide.md
    └── safety-guide.md
```

## The skill's core contract

The skill enforces a **terminology translation layer** for vibe-coders who don't know Git. When editing `SKILL.md` or the supporting guides, these invariants must hold:

1. **Two languages, two contexts** — User-facing explanations use translated Korean terms (`commit → 세이브`, `push → 올리기`, `branch → 갈래`, etc. with emojis). Actual `Bash` tool invocations still use real git commands (`git commit`, `git push`). The translation table at the top of `SKILL.md` is the source of truth — if you add a new term anywhere in the guides, add it to that table too.

2. **`git-status.sh` is the eyes** — the skill never reads git state by running ad-hoc `git status` / `git log` commands. It runs `bash dont-git-afraid/git-status.sh` and parses the structured output (sections delimited by `--- WORKING ---`, `--- STAGED ---`, `--- DANGERS ---`, etc.). If you change the script's output format, every parser-style instruction in `SKILL.md` must be updated in lockstep.

3. **Danger detection lives in the script, not the prompt** — `.env`, `node_modules`, `*.pem`, `id_rsa`, `credentials`, `secret` checks are emitted as `DANGER` / `WARN` lines by `git-status.sh`. Add new dangerous-file patterns there, not in `SKILL.md`.

4. **No commit hashes in user output** — `SKILL.md` explicitly forbids showing hashes like `804b133` to the user; show the commit message instead. This is a hard rule, not a stylistic preference.

5. **Side-by-side boxes break on Korean text** — `SKILL.md` warns against drawing two ASCII boxes next to each other because Korean wide characters misalign them. Use the stacked layouts already defined in the file.

## Where each scenario lives

When editing behavior, find the right file first — content is split, not duplicated:

- **Terminology table, status formats, daily-flow scenarios, beginner Q&A** → `SKILL.md`
- **Merge conflict resolution walk-through** → `conflict-guide.md`
- **Push-triggers-deploy explanations (Vercel etc.)** → `deploy-guide.md`
- **Lost-code recovery, secret-leak response, force-push warnings** → `safety-guide.md`

`SKILL.md`'s frontmatter `description` is what Claude Code uses to decide whether to load the skill — keep the trigger conditions in that block exhaustive.

## Testing changes

There is no automated test. To verify a change:

1. Copy or symlink the folder into a real project's `.claude/skills/` (or `~/.claude/skills/` for global).
2. Open Claude Code in a git repo and prompt something like `지금 내 Git 상태 어때?` or trigger a scenario you changed.
3. Confirm the output matches the format prescribed in `SKILL.md`.

## Language

All user-facing output, examples, and explanations in this repo are in **Korean**. Do not translate to English when editing.
