# Setting up Supabase for The Recipe Box

This connects the app to a real shared database instead of your phone's local
storage, so you and your partner see the same recipes, and edits sync between
devices automatically.

## 1. Create the project
1. Go to [supabase.com](https://supabase.com) and sign up (free).
2. Click **New project**. Name it anything (e.g. `recipe-box`), pick a region
   close to you, set a database password (save it somewhere — you likely
   won't need it again, but keep it just in case).
3. Wait ~2 minutes for it to spin up.

## 2. Create the table and security rules
1. In the left sidebar, go to **SQL Editor** → **New query**.
2. Open `schema.sql` from this folder, paste the whole thing in, and click **Run**.
   This creates the `recipes` table and locks it down so only signed-in users
   can read or write anything.

## 3. Load the recipes
1. Still in the SQL Editor, open a new query.
2. Open `seed.sql` from this folder, paste it in, and click **Run**.
   This loads all 27 recipes. Safe to re-run any time — it won't duplicate.

## 4. Create your two logins
1. Go to **Authentication** → **Users** → **Add user**.
2. Add yourself: your email + a password you choose.
3. Add your partner the same way with her email + a password.
   (No email verification step needed — this creates the account directly.)
4. Share the password with her however you'd share any password (password
   manager, in person, etc.) — there's no separate invite flow needed for two
   people.

## 5. Connect the app to your project
1. Go to **Project Settings** (gear icon) → **API**.
2. Copy the **Project URL** and the **anon public** key (NOT the `service_role`
   key — that one must never go in the app).
3. Open `index.html`, find this near the top of the `<script>` section:
   ```js
   const SUPABASE_URL = 'https://YOUR-PROJECT-REF.supabase.co';
   const SUPABASE_ANON_KEY = 'YOUR-ANON-PUBLIC-KEY';
   ```
4. Replace both with your actual values, save, and re-deploy (push to your repo).

## 6. Try it
Open the site, sign in with either login, and you should see all 27 recipes.
Edit something on one device — it should update on the other within a second
or two, no refresh needed.

## Notes
- The **anon public key is meant to be public** — it's safe to have it visible
  in the app's source code. It only works because the database rules
  (Row Level Security) require a valid login before any data is readable.
  Never put the `service_role` key anywhere in the app.
- **Backups**: use the **Export backup (.json)** button in the sidebar
  periodically — it downloads everything currently loaded. Supabase's free
  tier also keeps automatic backups on their end, but a local copy costs
  nothing.
- If you ever want to reset the data back to the original book, just re-run
  `seed.sql` — it overwrites by ID without duplicating.
