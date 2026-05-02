# Safety & emergency rescue guide

## .gitignore — managing the ignore list

### Auto-prompt when .gitignore is missing

If the project has no `.gitignore`, always prompt before the first save:

```
⚠️ Hold on! There's no ignore list (.gitignore)!

Without one, you'll save files you really shouldn't.
Like:
   📦 node_modules/ — tens of thousands of install files (NEVER upload this!)
   🔑 .env — passwords and API keys (uploading = security incident!)
   📁 .next/, dist/ — build output (no need to upload)

Want me to create an ignore list?
```

### Auto-create the ignore list

```
✅ Created the ignore list!

Now ignored:
   📦 node_modules/ — install files (re-fetched with npm install)
   🔑 .env, .env.local — passwords and API keys
   📁 .next/, dist/, build/ — build output
   📁 .DS_Store — Mac system files
   📁 .vscode/ — editor settings

These files will be ignored automatically when you save.
```

### .env warning

If a `.env` file or anything that could contain secrets is in the save list, always warn:

```
🚨🚨🚨 SECURITY WARNING 🚨🚨🚨

The .env file is in the save list!
This file probably contains passwords or API keys.

If it lands on GitHub, anyone in the world can read it!
Hacker bots scan GitHub 24/7!

🔴 Risky  [████]

Want me to add .env to the ignore list?
```

## Panic situations

### "I didn't do anything and I'm seeing red text"

```
😌 Red text doesn't always mean something is wrong!

Most common causes:
   📝 Files changed but not saved → save and you're fine
   ⬇️ A new version exists on GitHub → download to fix
   🌿 You're working in a different parallel copy → totally normal
```

### "All my code is gone!" (panic mode)

```
😰 Take a breath! You can almost always recover it.

When code seems to disappear:
   1️⃣ Switched copies before saving → switch back, it's still there
   2️⃣ Ran reset --hard → recoverable from the safety net (reflog)
   3️⃣ Deleted a file directly → recoverable from the last save point
   4️⃣ Stashed it away → just unshelve it

Let me check your current state and walk you through the recovery.
```

### "Something weird ended up on GitHub" (node_modules, .env, etc.)

```
😱 A file that shouldn't be there got uploaded!

📦 If node_modules got uploaded:
   1. Add node_modules/ to the ignore list
   2. Untrack it (git rm -r --cached node_modules)
   3. Save + upload

🔑 If .env got uploaded:
   1. ⚠️ Rotate the API keys / passwords RIGHT NOW!
      (they may already be compromised)
   2. Add .env to the ignore list
   3. Untrack it
   4. Save + upload

I'll walk you through each step.
```
