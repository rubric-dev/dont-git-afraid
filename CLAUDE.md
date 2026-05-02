# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

This repo **is** a Claude Code Skill — not an app that uses one. The deliverables are the `dont-git-afraid/` folder (Korean) and the `dont-git-afraid-en/` folder (English), which users copy into their own `.claude/skills/` (project-local) or `~/.claude/skills/` (global). There's no build, no tests, no package manager — editing the markdown files **is** the development loop.

## Repository layout

```
.
├── README.md              ← marketing / overview (Korean)
├── README.en.md           ← marketing / overview (English)
├── INSTALL.md             ← end-user install instructions (Korean)
├── INSTALL.en.md          ← end-user install instructions (English)
├── dont-git-afraid/       ← Korean skill (distributed)
│   ├── SKILL.md           ← main skill definition (frontmatter + behavior rules)
│   ├── git-status.sh      ← bash script the skill invokes to gather repo state
│   ├── conflict-guide.md
│   ├── deploy-guide.md
│   └── safety-guide.md
└── dont-git-afraid-en/    ← English skill (distributed; mirrors the Korean one)
    ├── SKILL.md
    ├── git-status.sh
    ├── conflict-guide.md
    ├── deploy-guide.md
    └── safety-guide.md
```

The two skill folders are intentional siblings — both can be installed under `.claude/skills/` simultaneously because their frontmatter `name:` differs (`dont-git-afraid` vs `dont-git-afraid-en`). Behavior rules, status formats, danger checks, and scenario lists must stay in lockstep across both folders. When you update one, mirror the change in the other.

## The skill's core contract

The skill enforces a **terminology translation layer** for vibe-coders who don't know Git. When editing `SKILL.md` or the supporting guides, these invariants must hold:

1. **Two languages, two contexts** — User-facing explanations use translated Korean terms (`commit → 세이브`, `push → 올리기`, `branch → 사본`, etc. with emojis). Actual `Bash` tool invocations still use real git commands (`git commit`, `git push`). The translation table at the top of `SKILL.md` is the source of truth — if you add a new term anywhere in the guides, add it to that table too.

2. **`git-status.sh` is the eyes** — the skill never reads git state by running ad-hoc `git status` / `git log` commands. It runs `bash dont-git-afraid/git-status.sh` and parses the structured output (sections delimited by `--- WORKING ---`, `--- STAGED ---`, `--- DANGERS ---`, etc.). If you change the script's output format, every parser-style instruction in `SKILL.md` must be updated in lockstep.

3. **Danger detection lives in the script, not the prompt** — `.env`, `node_modules`, `*.pem`, `id_rsa`, `credentials`, `secret` checks are emitted as `DANGER` / `WARN` lines by `git-status.sh`. Add new dangerous-file patterns there, not in `SKILL.md`.

4. **No commit hashes in user output** — `SKILL.md` explicitly forbids showing hashes like `804b133` to the user; show the commit message instead. This is a hard rule, not a stylistic preference.

5. **Side-by-side boxes break on Korean text** — `SKILL.md` warns against drawing two ASCII boxes next to each other because Korean wide characters misalign them. Use the stacked layouts already defined in the file. The English version keeps the same stacked layouts for visual consistency.

6. **English terminology uses friendly metaphors, not raw Git terms** — for `dont-git-afraid-en/`, the same translation philosophy applies (`commit → save 💾`, `push → upload ☁️`, `branch → copy 🌿`, etc.). The goal is not a literal translation of the Korean — it's making Git approachable for English-speaking vibe coders. Keep the English term table structurally aligned with the Korean one (same Git concepts covered) even if individual word choices differ. The English version inherits the same stacked layouts for consistency.

6. **English terminology uses friendly metaphors, not raw Git terms** — for `dont-git-afraid-en/`, the same translation philosophy applies (`commit → save 💾`, `push → upload ☁️`, `branch → copy 🌿`, etc.). The point is not literal translation of the Korean — it's making Git non-scary for English-speaking vibe coders. Keep the English table at the top of `dont-git-afraid-en/SKILL.md` aligned with the Korean one structurally (same Git concepts covered) even if individual word choices differ.

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

This repo ships in two languages:

- The Korean skill (`dont-git-afraid/`) and Korean docs (`README.md`, `INSTALL.md`) are written in **Korean**. Do not translate them to English when editing.
- The English skill (`dont-git-afraid-en/`) and English docs (`README.en.md`, `INSTALL.en.md`) are written in **English**. Do not translate them to Korean when editing.

The two are sibling translations of the same skill — when adding a new term, scenario, or rule to one, mirror the change in the other so they stay in sync.
