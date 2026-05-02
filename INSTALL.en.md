# Don't Git Afraid — install guide

> 🇰🇷 한국어 버전: [INSTALL.md](./INSTALL.md)

> This skill is for people who are scared of Git — so we made the install Git-free too. 🙂

## 🟢 Method 1 — ZIP download (no Git knowledge needed, recommended)

### 1. Get the ZIP from GitHub

1. Open this repo's GitHub page
2. Click the green **`<> Code`** button
3. Click **Download ZIP** at the bottom
4. Unzip `dont-git-afraid-main.zip`

### 2. Put `dont-git-afraid-en` into `.claude/skills/`

After unzipping, the `dont-git-afraid-main` folder contains a `dont-git-afraid-en` folder.
Move **that inner `dont-git-afraid-en` folder** as a whole.

**A. Use in this project only**

```
your-project/
└── .claude/
    └── skills/
        └── dont-git-afraid-en/   ← put it here
            ├── SKILL.md
            ├── git-status.sh
            └── ...
```

Create the `.claude/skills/` folder if it doesn't exist.

**B. Use in every project (global install)**

Drop it under `~/.claude/skills/` in your home folder and it'll apply automatically in every Claude Code session.

```
~/.claude/skills/dont-git-afraid-en/
```

### 3. Add the rule to CLAUDE.md

Paste the snippet below into your project's `CLAUDE.md` file (create one if it doesn't exist).
For a global install, put it in `~/.claude/CLAUDE.md`.

```markdown
## Git rules
When explaining, reporting, or confirming any Git work to the user,
always follow the terminology rules of the `dont-git-afraid-en` skill
(commit→save, push→upload, branch→copy, etc. + emojis).

When actually running git via the Bash tool, use the real git terms
(`git commit`, `git push`, ...).
```

### 4. Test

Try this in Claude Code:

```
What's my Git status right now?
```

Success looks like:

```
═══════════════════════════════════════
✨  Clean — everything saved and matches GitHub
═══════════════════════════════════════

📂 Workspace  →  🧺 Packed  →  💾 Saved  →  ☁️ GitHub ✓
```

---

## 🛠️ Method 2 — terminal / if you're comfortable with Git

```bash
# from your project folder
git clone https://github.com/rubric-dev/dont-git-afraid.git /tmp/dgaf
mkdir -p .claude/skills
cp -r /tmp/dgaf/dont-git-afraid-en .claude/skills/
```

For a global install, use `~/.claude/skills/` instead of `.claude/skills/`.

Then steps **3. Add to CLAUDE.md** and **4. Test** are the same as above.
