# Clash resolution guide

A clash is when vibe coders panic the most. Walk them through it calmly, step by step.

## Overall flow when a clash happens

```
💥 A clash happened! But don't worry, we'll fix it together.

What a clash is:
The same part of the same file was edited in two different places,
so Git is asking "which one should I keep?"
It's a normal situation and we can handle it!

═══════════════════════════════════════
Clash file list
═══════════════════════════════════════

   💥 src/Header.tsx
   💥 src/styles.css

📌 How to resolve (we'll do them one at a time):
```

## STEP 1 — understand the clash markers

```
📌 STEP 1 — how to read the clash markers

When you open the file, you'll see this:

   <<<<<<< HEAD
   (the code I changed)
   =======
   (the code GitHub / someone else changed)
   >>>>>>> main

   ↑ that's the clash spot

   <<<<<<< HEAD    ← my code starts here
   my code
   =======         ← divider
   their code
   >>>>>>> main    ← their code ends here
```

## STEP 2 — pick which code to keep

```
📌 STEP 2 — choose which code to keep

3 options:
   1️⃣ Keep only my code     → leave only the lines between <<<<<<< and =======
   2️⃣ Keep only their code  → leave only the lines between ======= and >>>>>>>
   3️⃣ Combine both          → mix the two together however makes sense

⚠️ Important: the <<<<<<<, =======, >>>>>>> markers MUST be deleted!
   If they're left in, the code won't run.
```

## STEP 3 — finish

```
📌 STEP 3 — finish up

Once you've fixed all the clashes, make a save point.
Just say "save" or "save it".

I can help too:
   "Show me both versions"  — I'll explain the differences
   "Use mine"               — I'll keep your version everywhere
   "Use theirs"             — I'll keep their version everywhere
   "Combine them"           — I'll help merge the two changes
```

## Cancel the clash resolution

```
↩️ Want to cancel and go back to the state before the combine?

I'll cancel the combine attempt itself,
so we go back to the moment before the clash happened.
Your changes won't be lost.

🟢 Safe  [█░░░]
```
