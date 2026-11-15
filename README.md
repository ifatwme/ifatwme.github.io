# ifatwme.github.io

Personal site of Fatemeh Ghasemi: bio, blog, projects and (later) research.
Built with [Jekyll](https://jekyllrb.com) and published by GitHub Actions on every push to `main`.

## Where things live

| I want to… | Edit |
|---|---|
| Change my name, tagline, email, avatar, CV link, profile links | `_config.yml` (top section) |
| Change the home-page introduction | `index.md` |
| Change my bio | `about.md` |
| Write a blog post | a new file in `_posts/` (see below) |
| Keep a post unpublished while I work on it | put it in `_drafts/` |
| Add / edit / reorder projects | `_data/projects.yml` |
| Add a paper or preprint | `_data/publications.yml` (the *Research* menu appears automatically) |
| Add images | `assets/img/` (e.g. `assets/img/posts/…`) |
| Add a CV or paper PDF | `assets/files/`, then link it (`cv: /assets/files/cv.pdf` in `_config.yml`) |
| Change colours or fonts | `assets/css/style.css` (variables at the top) |

Everything else (`_layouts/`, `_includes/`) is the theme. You rarely need to touch it.

## Writing a post

### From the browser (no tools needed)

1. On GitHub, open the `_posts` folder → **Add file → Create new file**.
2. Name it `YYYY-MM-DD-short-title.md`, e.g. `2026-11-20-why-i-study-ml.md`.
3. Paste this at the top, then write in Markdown below it:

   ```yaml
   ---
   title: "Why I study machine learning"
   description: "One sentence shown in lists and link previews."
   tags: [notes, machine-learning]
   ---
   ```

4. **Commit changes**. The site updates in about a minute (progress: *Actions* tab).

### From your computer

Needs Docker and `make` (nothing else, no Ruby install).

```bash
make post t="Why I study machine learning"    # creates _posts/<today>-why-i-study-machine-learning.md
make draft t="Half-formed idea"               # creates _drafts/half-formed-idea.md (not published)
make publish f=_drafts/half-formed-idea.md    # moves it to _posts/ with today's date
make serve                                    # preview at http://localhost:4000, reloads on save
git add -A && git commit -m "New post" && git push
```

### Post options (front matter)

| Key | Effect |
|---|---|
| `title` | Post title (required) |
| `description` | One-line summary for lists, search engines and link previews |
| `tags: [a, b]` | Tags; listed on `/blog/tags/` |
| `math: true` | LaTeX with KaTeX: `$$ E = mc^2 $$` |
| `lang: fa` | Persian, right-to-left post (Vazirmatn font) |
| `updated: 2026-12-01` | Shows "updated …" under the date |
| `published: false` | Hide a post without moving it to `_drafts/` |
| `image: /assets/img/posts/x.jpg` | Picture used for link previews (LinkedIn, etc.) |

## Projects

Each entry in `_data/projects.yml` is one card. Only `title` and `summary` are required; the
file's header explains every field. Useful ones:

- `featured: true` shows the project on the home page (first four).
- `repo:` link to the code; leave it out and set `private: true` for closed-source work.
- `demo:` a **public** live demo; `writeup:` a blog post about it; `paper:` a PDF or preprint.

## Publishing

Pushing to `main` runs `.github/workflows/pages.yml` (build with Jekyll 4, deploy to GitHub
Pages). If a build fails, the *Actions* tab shows the error and the old version stays online.
Pull requests are built but not deployed, so you can check a change before merging.

One-time repository setting: **Settings → Pages → Source: GitHub Actions**.

## Maintenance

- `make build` runs the same production build locally into `_site/` (ignored by git).
- `make update` upgrades Jekyll and plugins in `Gemfile.lock`.
