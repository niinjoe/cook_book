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

## What's in the box
All 27 recipes from *Joseph's Recipe Book* are fully seeded — ingredients, gram (or
ml/tsp/tbsp/count) amounts, method steps, and the tips/notes from the book — across
Pizza, Breads & Baked Goods, Desserts, Dairy, Breakfast & Snacks, Meal Prep,
Condiments & Sauces, and Mocktails. Multi-part recipes (cheesecake, shokupan,
sticky toffee pudding, etc.) keep their ingredient sections (Crust / Filling,
Tangzhong / Dough, and so on).

The two idea-list entries (Best High-End Sauces for Cheesecake, Cottage Cheese —
Quick-Use Ideas) are reference lists rather than single scalable recipes, so they
skip the yield stepper and show their ratios/ideas as steps instead.

**Download PDF version** in the sidebar gives you back the original formatted PDF
any time — handy for printing or sharing.

## Backing up your data
Since everything lives in the browser's IndexedDB (per-device, per-browser), use
**Export backup (.json)** in the sidebar regularly, and **Import backup** to restore
or move data to another device/browser. This is also how you'd migrate data if you
ever wipe your browser storage.

## Editing recipes
- **Yield stepper** on each recipe scales every gram amount proportionally.
- Ingredients without a gram amount (e.g. "to taste", "as needed") just show the note.
- Categories are free-form — add a new one right from the Add/Edit form.
