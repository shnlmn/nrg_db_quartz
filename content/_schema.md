# Wiki Schema

This document defines the conventions for this LLM-maintained research wiki.
Edit it to shape how Claude ingests sources, answers queries, and lints the wiki.

## Purpose

A persistent, evolving knowledge base of research notes, papers, and synthesized
insights. Sources are immutable; wiki pages are owned and maintained by the LLM.

## Folder layout

- `raw/` — immutable source material (PDFs, web clippings, transcripts, notes)
- `pages/` — wiki pages, one entity or concept per file
- `_index.md` — catalog of all pages with one-line summaries
- `_log.md` — append-only chronological record of ingests, queries, lint runs
- `_schema.md` — this file

## Page conventions

- One concept, entity, person, paper, or method per page.
- Filename: `kebab-case.md`. Title in H1 matches the filename in Title Case.
- Front-matter:
  ```
  ---
  type: concept | entity | paper | method | person | finding
  sources: [raw/source-a.pdf, raw/source-b.md]
  updated: YYYY-MM-DD
  ---
  ```
- Body sections (use what applies):
  - **Summary** — 1–3 sentence definition.
  - **Key claims** — bulleted, each with a `[[wikilink]]` to the source page.
  - **Related** — `[[wikilinks]]` to adjacent pages.
  - **Open questions** — unresolved items the wiki should track.
- Cite source pages with `[[raw/source-name]]` style wikilinks (Obsidian-resolvable).
- Every non-trivial claim must trace to at least one source.

## Ingest behavior

When a new file appears in `raw/`:

1. Read it fully.
2. Identify entities, concepts, claims, and findings worth wiki pages.
3. For each, either create a new `pages/` file or update an existing one.
4. Update `_index.md` with any new/changed page.
5. Append an entry to `_log.md` describing what was ingested and what changed.

Prefer updating existing pages over creating duplicates. Merge synonyms.

## Query behavior

When asked a question:

1. Search `pages/` first. Cite pages by wikilink in the answer.
2. Only fall back to `raw/` if no wiki page covers the topic.
3. If the answer is novel and likely to be reused, propose promoting it to a
   new wiki page (the user will confirm).

## Lint behavior

When asked to lint:

- Contradictions between pages (flag pairs).
- Stale claims (sources removed or superseded).
- Orphan pages (no inbound wikilinks and not in `_index.md`).
- Missing cross-references (page A discusses page B's topic without linking).
- Pages without sources.
- Raw sources not yet incorporated: every file in `raw/` that is not cited
  by any wiki page (via `sources:` frontmatter or wikilinks). These are
  candidates for re-ingestion.

Write findings to a fresh `_lint-report.md` and append a one-line summary to `_log.md`.