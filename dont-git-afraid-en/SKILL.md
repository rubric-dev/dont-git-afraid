---
name: dont-git-afraid-en
description: |
  A skill that explains Git operations visually for vibe coders.
  Activates automatically before and after running Git commands.

  Use this skill in the following situations:
  - Whenever running git add, commit, push, pull, merge, rebase, checkout, switch, stash, etc.
  - When starting a project with git init or git clone
  - When you need to explain the Git status to the user
  - When Git work is needed during a deploy
  - When creating or switching branches
  - When a conflict happens
  - For .gitignore-related work
  - When GitHub auth/connection problems happen
  - When the user is in panic mode ("my code is gone!", "I got an error!")
  - When viewing history/changes with git log, git diff, etc.
  - When the user asks beginner questions like "What is Git?", "Why use it?", "How do I start?"
  - When the user looks new to Git (uses scared language, doesn't know terms)

  Core principle of this skill: never use raw Git terms. Translate every Git concept into everyday language.
allowed_tools:
  - bash
---

# Don't Git Afraid 🎮💾

A visual Git guide skill for vibe coders who are scared of Git.

**Core principle: the user does not know Git. Translate every Git concept into everyday language.**

## Terminology rules (hard rule)

Never use raw Git terms with the user. Always swap them for the friendly version below:

| ❌ Don't say | ✅ Say this | Emoji |
|---|---|---|
| commit | save | 💾 |
| push | upload | ☁️ |
| pull | download | 📥 |
| branch | copy | 🌿 |
| merge | combine | 🤝 |
| stage / git add | pack | 🧺 |
| stash | shelf it | 🗄️ |
| rebase | reorder | ⏳ |
| checkout / switch | switch copy | 🚶 |
| conflict | clash | 💥 |
| HEAD | current spot | 📍 |
| remote / origin | GitHub (the cloud) | 🌐 |
| working directory | workspace | 📂 |
| repository | project home | 🏠 |
| clone | grab a copy | 📋 |
| diff | what changed | 🔍 |
| log | save history | 📜 |
| reset | rewind | ↩️ |
| force push | force overwrite | ⚠️ |
| tag | bookmark | 🔖 |
| .gitignore | ignore list | 🙈 |
| init | start a project home | 🏠 |
| reflog | safety net | 🆘 |
| cherry-pick | pick one save | 🍒 |
| fetch | just peek | 👀 |
| upstream | original source | 🏔️ |
| PR / Pull Request | "please-merge" request | 📮 |
| fork | my own copy | 🍴 |
| .env | secret config file | 🔑 |
| node_modules | installed packages | 📦 |
| deploy | deploy (publish online) | 🚀 |
| ahead | unpublished saves | ⬆️ |
| behind | new updates available | ⬇️ |
| diverged | each side worked separately | 🔀 |
| synced | matched up | ✅ |
| rejected | upload rejected | ❌ |
| staged | packed up | 🧺 |

## 🤔 What is Git? — for absolute beginners

When the user asks "What is Git?", "Why should I use it?", "How do I start?", use the explanations below.

### What is Git?

```
💡 Git = a save-file manager for your code

You know how you save your game?
Git saves your code, and lets you go back to a previous save if you need to.

Without saves:
   ❌ One bad edit and your working code is broken forever
   ❌ "Yesterday's version was better..." — no way back
   ❌ Computer dies → everything is gone

With saves (Git):
   ✅ Mess up however badly — just go back to a previous save
   ✅ A record of when and what you changed
   ✅ Upload to GitHub and you've got a backup too
```

### What is GitHub?

```
💡 GitHub = the cloud where your save files live

Git ≠ GitHub!

   Git    = the tool that manages saves on your computer
   GitHub = the place online where those saves are stored

Once you upload to GitHub:
   ☁️ Computer dies, code survives
   👥 You can work with other people
   🚀 Tools like Vercel can auto-deploy from it
```

### How do I get started?

```
📌 First-time setup checklist

1️⃣ Sign up for GitHub → make an account at github.com
2️⃣ Install Git → already on Mac, on Windows grab it from git-scm.com
3️⃣ Log into GitHub → in the terminal: gh auth login
4️⃣ Start a project
   • New project → start a project home (git init) + connect GitHub
   • Existing project → grab a copy (git clone)
5️⃣ Work → edit code → save → upload to GitHub
```

### Daily flow

```
📌 The vibe-coding daily routine

   Tell the AI to write some code
      ↓
   AI writes it
      ↓
   🧺💾☁️ Save and upload to GitHub (in one go!)
      ↓
   Tell it to do more
      ↓
   Repeat!

Save as many times a day as you want.
The more often the better — you save your game often, right?!
```

## 💻 vs ☁️ — your computer and GitHub are separate (key concept)

This is the concept that confuses vibe coders the most. When "ahead" or "behind" come up, always explain this first.

### The basic idea

If the user doesn't seem to get it, explain like this:

```
💡 Just remember this:

   💻 The code on your computer
   ☁️ The code on GitHub

   These two do NOT sync automatically!

   You change code → GitHub doesn't know.
   Someone uploads to GitHub → your computer doesn't know.

   So:
   💾 Save     = mark "I'm done up to here" on your computer
   ☁️ Upload   = send those marks to GitHub
   📥 Download = grab whatever's new on GitHub onto your computer

   Saved but didn't upload?
   → It only exists on your computer, not on GitHub!
```

### The 4 states

When showing state, use the formats below.

⚠️ Rules:
- Don't show hashes (like `804b133`). Show the save message instead.
- Don't draw two boxes side-by-side. Wide characters break the alignment. Use the formats below.

**✅ Synced** — the best state
```
✅ Your computer = GitHub — they match. Perfect!
```

**⬆️ Unpublished saves (ahead)**
```
⬆️ 2 saves not yet on GitHub

   💻 "Polish the review pipeline"  (5 days ago)
   💻 "Add Git helper skill"        (just now)

   Not dangerous — you just don't have a backup yet.
   Upload to GitHub and you'll be in sync.
```

**⬇️ New updates available (behind)**
```
⬇️ 2 new uploads on GitHub

   ☁️ "Fix header layout"  (1 hour ago)
   ☁️ "Bug hotfix"         (3 hours ago)

   Download them and your computer will catch up.
```

**🔀 Each side worked separately (diverged)**
```
🔀 Both sides did their own thing!

   💻 Only on your computer:
      "Add dashboard"  (30 minutes ago)

   ☁️ Only on GitHub:
      "Fix header"   (1 hour ago)
      "Bug hotfix"   (2 hours ago)

   😌 Looks scary but it's solvable!
   Most of the time downloading will combine them automatically.
```

### When upload is rejected

```
❌ Upload was rejected!

In plain English:
   You: "GitHub, here you go!"
   GitHub: "Hold on — there's stuff here you don't have. Grab it first!"

How to fix:
   📥 Download → 🤝 Combine → ☁️ Upload = done!
```

### "But I'm the only one using this — why?"

```
🤔 This happens when:
   1️⃣ You saved but never uploaded → upload and you're done!
   2️⃣ You edited a file directly on the GitHub website → download to fix
   3️⃣ You worked from another computer → download to fix
Almost always one download fixes it! 😌
```

## How to check status

Before any Git operation, always analyze the current state. Run the `git-status.sh` script in this skill's folder:

```bash
bash <SKILL_DIR>/git-status.sh
```

Parse its output and show it to the user using the formats below.

## Display formats

### 1. Status banner (always show first)

```
═══════════════════════════════════════
📝  Working — 3 files changed, not saved yet
═══════════════════════════════════════
```

Status types:
- ✨ **Clean** — everything saved and matches GitHub
- 📝 **Working** — files changed, not saved yet
- 🧺 **Packed** — picked which files to save
- ⬆️ **Unpublished** — saved but not uploaded to GitHub
- 💥 **Clash** — same file changed on both sides, you have to pick
- 😱 **Time-travel mode** — detached HEAD. Risky state.

### 2. Flow diagram (always show)

```
📂 Workspace (3)  →  🧺 Packed  →  💾 Saved  →  ☁️ GitHub ✓
```

### 3. Risk level (always show before any Git operation)

```
🟢 Safe    [█░░░]    — upload, save, pack
🟡 Careful [██░░]    — download (when you have changed files)
🟠 Caution [███░]    — reorder, combine
🔴 Risky   [████]    — force overwrite, hard rewind
```

Always also show whether it's reversible:
```
↩️ Reversible — you can go back to the previous state any time.
⚠️ Hard to reverse — decide carefully.
```

### 4. File list (vary the format by count)

**5 or fewer → list them all:**
```
📂 Workspace (3)
   ✏️ src/App.tsx       [changed]
   🆕 src/NewPage.tsx   [new]
   🗑️ src/OldPage.tsx   [deleted]
```

**6–15 → group by folder:**
```
📂 Workspace (12)
   📁 src/pages/orders/
      ✏️ OrdersPage.tsx       [changed]
      ✏️ OrderDetailPanel.tsx [changed]
      🆕 ExcelOrderModal.tsx  [new]
   📁 src/hooks/
      🆕 useOrderList.ts        [new]
      🆕 useUploadOrderExcel.ts [new]
   📁 other
      ✏️ package.json [changed]
      ✏️ CLAUDE.md    [changed]
```

**16 or more → folder summary only:**
```
📂 Workspace (27)
   📁 src/pages/orders/    — 5 (3 changed + 2 new)
   📁 src/hooks/orders/    — 2 (2 new)
   📁 .claude/skills/      — 5 (5 new)
   📁 docs/specs/          — 3 (1 changed + 2 new)
   📁 other                — 12

   Tell me if you want the full list.
```

### 5. 💻 vs ☁️ status (only when needed)

Only show this when:
- ⬆️ there are unpublished saves
- ⬇️ there are new uploads to download
- 🔀 the two sides diverged

If they're synced, the one-line flow diagram is enough — skip this.
Don't draw two boxes side by side — wide characters break alignment. Use the "4 states" formats above.

### 6. Save history

```
💾 Recent saves
   🟢 Login page done   (2 hours ago) [☁️ on GitHub]
   🟡 Change button color (just now)  [💻 your computer only]
```

## Per-operation rules

### Save (git add + commit)

**Before:**
```
🧺 → 💾 I'll save now

Will be saved:
   ✏️ src/App.tsx       [changed]
   🆕 src/NewPage.tsx   [new]

🟢 Safe  [█░░░]
↩️ Reversible
```

**After:**
```
✅ Saved!
   💾 "Login page done"
   📁 2 files saved
   💻 Still only on your computer (let me know to upload)
```

### Upload (git push)

**Before:**
```
💾 → ☁️ I'll upload to GitHub
   💻 Your computer  ──[ 2 saves ]──→  ☁️ GitHub

🟢 Safe  [█░░░]
↩️ Reversible
```

**After:**
```
✅ Uploaded to GitHub!
   💻 ═══ ✓ ═══ ☁️ GitHub  matched up
```

### Download (git pull)

**Before — no changed files:**
```
☁️ → 💻 I'll download new uploads from GitHub
🟢 Safe  [█░░░]
```

**Before — with changed files:**
```
☁️ → 💻 I'll download new uploads from GitHub

🟡 Careful  [██░░]
⚠️ You have 3 files in progress.
   If they don't touch the same files, it'll combine itself.
   I'll let you know if there's a clash.
```

**After (clash):**
```
💥 Clash!
Same file edited on both sides — can't combine automatically:
   💥 src/Header.tsx — pick which side's code to keep

Open the file and you'll see <<<<<<< markers.
Top = your code, bottom = GitHub's code.
Keep what you want, delete the rest.
```

### Switch copy (git checkout / switch)

**Before:**
```
🌿 I'll switch to another copy
   🌿 main  →  🌿 feature/login
The original (main) stays intact. No worries!
🟢 Safe  [█░░░]
```

### Combine (git merge)

**Before:**
```
🤝 I'll combine the copies
   🌿 feature/login  →  🌿 main
🟠 Caution  [███░]
If they didn't touch the same files, it'll combine itself.
↩️ Reversible
```

### Reorder (git rebase)

**Before:**
```
⏳ I'll reorder the saves

Now:        A - B ⤵
                  your work
After:      A - B - your work

🟠 Caution  [███░]
The save history will change.
↩️ Reversible
```

### Force overwrite (git push --force)

**Before:**
```
⚠️⚠️⚠️ Force overwrite ⚠️⚠️⚠️
This completely replaces the history on GitHub with yours!
   💻 Your history  ═══⟹  ☁️ existing history deleted

🔴 Risky  [████]
⚠️ Hard to reverse
⚠️ Other people's uploads could disappear!
Sure you want to do this?
```

### Rewind (git reset)

**Before (soft/mixed):**
```
↩️ I'll rewind the last save
Your code isn't deleted!
🟡 Careful  [██░░]
```

**Before (hard):**
```
⚠️ I'll rewind the save AND restore the files to their old state
Everything you changed will be gone!
🔴 Risky  [████]
⚠️ Hard to reverse
```

## Save + upload combo (the most common pattern)

```
🧺 Step 1 — packing...
   ✏️ src/App.tsx        [changed]
   🆕 src/Dashboard.tsx  [new]

💾 Step 2 — saving...
   ✅ "Add dashboard page"
   📁 2 files saved

☁️ Step 3 — uploading to GitHub...

═══════════════════════════════════════
✅  Save + upload to GitHub done!
═══════════════════════════════════════
   🧺 Pack → 💾 Save → ☁️ Upload  done!
   💻 ═══ ✓ ═══ ☁️ GitHub  matched up
🟢 Safe  [█░░░]
```

## Starting a project

### Grab a copy (git clone)

**Before:**
```
📋 I'll grab the project from GitHub
   🌐 GitHub  ──[ full copy ]──→  💻 Your computer
🟢 Safe  [█░░░]
The copy goes into a new folder, so nothing here is touched.
```

**After:**
```
✅ Got the copy!
   📂 ./my-project folder created
   📁 42 files, 15 saves of history included
   🌿 Current copy: main
```

### Start a project home (git init)

**After:**
```
✅ Project home created!
   🏠 You can save in this folder now
⚠️ Not connected to GitHub yet.
```

### Connect GitHub (git remote add)

**After:**
```
✅ GitHub connected!
   🌐 Address: github.com/username/my-project
Save and upload, and you'll see it on GitHub.
```

**When GitHub auth fails:**
```
🔐 You need to log into GitHub

Easiest way:
   In the terminal: gh auth login
   → A browser opens, log in, done!
🤔 Not sure what to do? Use this one!
```

## Shelf it (git stash)

**After shelving:**
```
✅ Shelved!
   🗄️ Drawer #1: 3 files
   📂 Workspace is clean now.
When you're done with the other thing, say "unshelve it".
```

**After unshelving:**
```
✅ Unshelved!
   ✏️ src/Search.tsx     — back
   🆕 src/SearchBar.tsx  — back
You can pick up where you left off!
```

## View save history (git log)

```
📜 Save history
   🟢 Add dashboard page    (30 min ago) [☁️ on GitHub]
   🟡 Change button styling (3 hours ago) [💻 your computer only]
   🟢 Initial project setup (yesterday)   [☁️ on GitHub]
💡 Tell me if you want to go back to a specific save.
```

## See what changed (git diff)

```
🔍 What changed since the last save

📄 src/App.tsx
   ➕ 3 added  ➖ 1 removed
📄 src/Login.tsx
   ➕ 15 added

📊 Total: ➕ 18 added  ➖ 1 removed (2 files)
```

## Error message translation

When a Git error appears, replace it with the friendly version below:

| Git error | Say this instead |
|---|---|
| `not a git repository` | 🚫 This isn't a project home yet. Start one or grab a copy from GitHub first. |
| `Authentication failed` | 🔐 You need to log into GitHub. |
| `CONFLICT` | 💥 Clash! The same file was changed in multiple places — can't combine automatically. |
| `rejected` / `non-fast-forward` | ⬇️ There's something new on GitHub. Download first, then upload. |
| `nothing to commit` | ✨ Nothing to save! Everything is already saved. |
| `Already up to date` | ✅ Already up to date! |
| `MERGING` | 🤝 A combine is in progress. Resolve the clash or cancel it. |
| `detached HEAD` | 😱 You're poking around an old save. Working here can leave you stranded! |
| `Permission denied` | 🔒 You don't have access to this project home. |
| `Could not read from remote` | 🌐 Can't reach GitHub. Check your internet or the address. |
| `failed to push some refs` | ⬇️ There's new work on GitHub you don't have. Download first, then upload. |
| `refusing to merge unrelated histories` | 🤔 These projects were made separately. I can help force-combine them. |
| `Your branch is behind` | ⬇️ A newer version exists on GitHub. Download to catch up. |
| `Changes not staged for commit` | 📝 You have changed files that aren't packed yet. |
| `You have unmerged paths` | 💥 There are clash files you haven't resolved yet. |
| `cannot lock ref` | 🔒 Another Git operation is still running. Wait a moment. |
| `large file detected` | 📦 File too big! GitHub won't accept files over 100MB. |

## Ignore list & security & emergency rescue

See `safety-guide.md`.

Key points:
- Before the first save, check that .gitignore exists
- If .env is packed, always warn (🚨)
- If node_modules is packed, always warn
- "My code is gone!" → lead with "you can almost always recover it"

## Clash resolution

See `conflict-guide.md`.

Key points:
- Reassure: clashes are normal and fixable
- Offer choices: "your code? their code? both?"

## Deploy integration

See `deploy-guide.md`.

Key idea: just upload (push) and Vercel/Netlify deploys for you.

## Hard behavior rules

1. **Don't show raw Git commands.** Hide the actual git invocations.
2. **Don't show hashes (like `804b133`).** Show the save message ("Login done") instead. Hashes mean nothing to the user.
3. **Always say "upload to GitHub", not just "upload".** Plain "☁️ upload" is ambiguous — make GitHub explicit ("upload to GitHub", "on GitHub").
4. **Always check status first.** Run `git-status.sh` before doing anything.
5. **Always explain before running.** What you'll do, the risk level, whether it's reversible.
6. **Always show the result after running too.** Not just "done" — show what changed.
7. **For risk 🟠 or higher, ask first.** Don't just go ahead.
8. **For clashes, stay calm.** Clashes are normal.
9. **Check .gitignore before the first save.**
10. **If .env is packed, always block it.** Security comes first.
11. **In panic situations, lead with "you can almost always recover".**
12. **For deploys, show the whole picture first.**
13. **Keep output from getting too long.** Vary the file-list summary by count (see Display format #4). Only show the 💻 vs ☁️ diagram when there's a sync issue. Don't repeat the same info in multiple shapes.
