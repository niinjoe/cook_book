# The Recipe Box

A gram-precise personal recipe book, built the same way as the gym tracker: a static,
installable PWA with no backend — all your recipes live in your browser's IndexedDB.

## Run it locally
Just open `index.html` in a browser, or serve the folder:
```
python3 -m http.server 8080
```
then visit `http://localhost:8080`.

## Deploy to GitHub Pages
1. Create a new repo (e.g. `recipe-box`) and push these three files
   (`index.html`, `manifest.json`, `sw.js`) to the root, or to a `docs/` folder.
2. In the repo settings → Pages, set the source to the branch/folder you used.
3. Your site will be live at `https://<username>.github.io/recipe-box/`.
4. On your phone, open the link and use "Add to Home Screen" — it installs like an app.

## What's seeded vs. what needs filling in
Recipes marked **"needs details"** are placeholders carried over straight from the
recipe book's table of contents (title, category, and any notes I already had) —
the ingredients/steps are empty. Open any of them and hit **Edit** to fill in amounts
and method; it'll flip to "complete" automatically once you save.

Fully seeded from what we've built together so far:
- NY-Style Pizza Dough (6 × 12" balls)
- High-End Cheesecake (restaurant style, water bath)
- Greek Yogurt Cream Cheese (Labneh)
- NY Strip Meal Prep Cubes & Air Fryer Sweet Potatoes

## Backing up your data
Since everything lives in the browser's IndexedDB (per-device, per-browser), use
**Export backup (.json)** in the sidebar regularly, and **Import backup** to restore
or move data to another device/browser. This is also how you'd migrate data if you
ever wipe your browser storage.

## Editing recipes
- **Yield stepper** on each recipe scales every gram amount proportionally.
- Ingredients without a gram amount (e.g. "to taste", "as needed") just show the note.
- Categories are free-form — add a new one right from the Add/Edit form.
