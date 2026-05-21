# MiMo 100T Builder Showcase

AI-assisted builder showcase for Xiaomi MiMo 100T submission.

This repository demonstrates a Telegram-controlled Hermes Agent workflow used for web prototyping, deployment checks, submission packaging, and repeatable builder automation.

## Live GitHub Pages demo

After GitHub Pages is enabled, the static demo is available at:

- https://rizkibkw.github.io/mimo-100t-builder-showcase/store/
- https://rizkibkw.github.io/mimo-100t-builder-showcase/landpage/
- https://rizkibkw.github.io/mimo-100t-builder-showcase/sketches/

## What's inside

- `store/` — static storefront demo for premium landing page templates.
- `landpage/` — landing page template collection.
- `sketches/` — extra UI/web prototypes.
- `submission-materials/` — ThemeForest-style package notes and marketplace submission materials.
- `MIMO_SUBMISSION_NOTES.md` — MiMo submission checklist and proof guidance.
- `project_description_english.txt` — short project description prepared for the MiMo form.

## How to view locally

Open these files in a browser:

- `store/index.html`
- `landpage/index.html` if present
- any HTML file under `sketches/`

No backend or build step is required; these are static demo assets.

## Builder workflow summary

The workflow uses Hermes Agent from Telegram to:

1. understand the project goal,
2. inspect local files and web routes,
3. generate/edit web prototypes,
4. prepare submission materials,
5. verify outputs through terminal checks,
6. package the result for public review.

## Note

This repo intentionally excludes credentials, API keys, and private server configuration.
