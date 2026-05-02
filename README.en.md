# Don't Git Afraid 🎮💾

> An AI agent skill for vibe coders who are scared of Git.

> 🇰🇷 한국어 버전: [README.md](./README.md)

## What is this?

In the middle of vibe-coding, your AI suddenly says it'll run `git rebase origin/main --onto feature/login`. Scary, right?

Install this skill and the AI will translate Git talk like this:

```
❌ Before:
"I'll run git push --force-with-lease origin main"
→ 😨 …what???

✅ After:
⚠️⚠️⚠️ Force overwrite ⚠️⚠️⚠️
This completely replaces the history on GitHub with yours!
🔴 Risky  [████]
Sure you want to do this?
→ 😮 oh — that's the dangerous one. Hold on!
```

## Install (1 minute)

> We made the install Git-free first, so you don't need to know Git to set it up. 🙂

### 1. Download the ZIP

1. Click the green **`<> Code`** button at the top of this page → **Download ZIP**
2. Unzip it
3. Move the **`dont-git-afraid-en`** folder inside into `.claude/skills/`
   - Project-only: `your-project/.claude/skills/dont-git-afraid-en/`
   - All projects (global): `~/.claude/skills/dont-git-afraid-en/`
   - Create the folder if it doesn't exist

> Already comfortable with Git? `git clone` it and copy just the `dont-git-afraid-en` folder. See [INSTALL.en.md](./INSTALL.en.md) for details.

### 2. Add to CLAUDE.md

```markdown
## Git rules
When explaining, reporting, or confirming any Git work to the user,
always follow the terminology rules of the `dont-git-afraid-en` skill
(commit→save, push→upload, branch→copy, etc. + emojis).

When actually running git via the Bash tool, use the real git terms
(`git commit`, `git push`, ...).
```

### 3. Test

```
What's my Git status right now?
```

If it looks like this, you're set!

## What does it do?

### 🗣️ Translates Git into normal language

| Git term | What the skill says |
|---|---|
| commit | 💾 save |
| push | ☁️ upload to GitHub |
| pull | 📥 download |
| branch | 🌿 copy |
| merge | 🤝 combine |
| stage / add | 🧺 pack |
| stash | 🗄️ shelve it |
| rebase | ⏳ reorder |
| conflict | 💥 clash |

### 📊 Status at a glance

```
═══════════════════════════════════════
📝  Working — 3 files changed, not saved yet
═══════════════════════════════════════

📂 Workspace (3)  →  🧺 Packed  →  💾 Saved  →  ☁️ GitHub ✓
```

When there are lots of files, it summarizes by folder:

```
📂 Workspace (27)
   📁 src/pages/orders/    — 5 (3 changed + 2 new)
   📁 src/hooks/orders/    — 2 (2 new)
   📁 .claude/skills/      — 5 (5 new)
   📁 other                — 15
```

### ⚠️ Risk indicator

Before any Git operation, you'll know if it's safe or risky:

```
🟢 Safe    [█░░░]    — save, upload to GitHub
🟡 Careful [██░░]    — download (when you have changed files)
🟠 Caution [███░]    — combine, reorder
🔴 Risky   [████]    — force overwrite
```

### 🧺💾☁️ Save + upload in one shot

```
🧺 Step 1 — packing...
   ✏️ src/App.tsx        [changed]
   🆕 src/Dashboard.tsx  [new]

💾 Step 2 — saving...
   ✅ "Add dashboard page"

☁️ Step 3 — uploading to GitHub...

✅ Save + upload to GitHub done!
   💻 ═══ ✓ ═══ ☁️ GitHub  matched up
```

### 🤔 Beginner-friendly

Questions like "What is Git?", "Why use it?", "How do I start?" get explained with the game-save analogy.

```
💡 Git = a save-file manager for your code

You know how you save your game?
Git saves your code, and lets you go back to a previous save if you need to.
```

### 🚨 Security incident prevention

If `.env` or `node_modules` is about to land on GitHub, the skill blocks it:

```
🚨🚨🚨 SECURITY WARNING 🚨🚨🚨
The .env file is about to be packed!
If it lands on GitHub, anyone in the world can read it!
🔴 Risky  [████]
```

### 😰 Panic mode

For "all my code is gone!" moments, calm guidance:

```
😰 Take a breath! You can almost always recover it.
Let me check your current state...
```

### 💥 Clash resolution guide

When a clash happens, a 3-step walkthrough:

```
💥 Clash! But don't worry.
Pick which side's code to keep:
   1️⃣ Mine
   2️⃣ Theirs
   3️⃣ Combine both
```

### 🚀 Deploy integration

The "push triggers a deploy" flow at a glance:

```
📂 Edit code → 💾 Save → ☁️ GitHub → 🚀 Auto-deploy → 🌐 Site updated!
```

## Full coverage

### Git operations (15)
Save, upload, download, combo (one-shot), switch copy, make a copy, combine, reorder, force overwrite, rewind, grab a copy (clone), start a project home (init), connect GitHub, shelve it (stash), unshelve

### Status detection (6)
✨ clean / 📝 working / 🧺 packed / ⬆️ unpublished / 💥 clash / 😱 time-travel mode

### Safety nets
🙈 .gitignore auto-detect / 🚨 .env block / 📦 node_modules prevention / 🔑 secret-file detection

### Error translation (17)
Git error messages auto-translated into friendly English

### Beginner guides
What Git is / What GitHub is / How to start / Daily flow

### Separate guides
💥 Clash resolution (conflict-guide.md) / 🚀 Deploy integration (deploy-guide.md) / 🛡️ Safety & emergency rescue (safety-guide.md)

## File layout

```
dont-git-afraid-en/
├── SKILL.md           ← main (terminology, formats, scenarios, beginner guide)
├── git-status.sh      ← status analyzer script
├── conflict-guide.md  ← clash resolution guide
├── deploy-guide.md    ← deploy integration guide
└── safety-guide.md    ← safety & emergency rescue
```

## License

MIT
