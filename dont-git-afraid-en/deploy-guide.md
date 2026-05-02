# Deploy integration guide

Hosting services like Vercel and Netlify watch your GitHub project — once you upload (push), they auto-deploy your site.

## Explain the deploy flow

When deploy-related work comes up, show the whole flow first:

```
🚀 Deploy = publishing your code to the internet

The full flow:

   📂 Edit code
      ↓
   🧺 Pack (git add)
      ↓
   💾 Save point (git commit)
      ↓
   ☁️ Upload to GitHub (git push)
      ↓
   🚀 Auto-deploy! ← Vercel/Netlify handles it for you
      ↓
   🌐 Site updated!

In other words: all you do is upload (push)!
Vercel/Netlify watches GitHub and deploys automatically.
```

## After deploy — show status

```
✅ Uploaded to GitHub! + 🚀 Auto-deploy started

   💻 ═══ ✓ ═══ ☁️ GitHub ═══ 🚀 ═══ 🌐

Vercel/Netlify just kicked off the deploy.
Usually 1–3 minutes until the site updates.

You can check deploy status on GitHub or in the Vercel/Netlify dashboard.
```

## When deploy fails

```
⚠️ When a deploy can fail

Upload (push) succeeded but the deploy failed.
This isn't a Git problem — it's a code problem:

   ❌ Build error — there's a syntax mistake in the code
   ❌ Missing env vars — you didn't set .env values in Vercel/Netlify
   ❌ Dependency issue — something is missing in package.json

The deploy logs will tell you why.
Vercel: vercel.com/dashboard
Netlify: app.netlify.com
```
