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
  - **Summary** (REQUIRED, must be FIRST section) — 2–5 sentences, everything a
    reader needs to know for most purposes. Place it so a partial read of the
    first ~40 lines captures it. Its FIRST SENTENCE is the page's short teaser
    (what `_index.md` reproduces), so write that sentence as a self-contained
    one-line description of the page.
  - **Key claims** — bulleted, each with a `[[wikilink]]` to the source page.
  - **Related** — `[[wikilinks]]` to adjacent pages.
  - **Open questions** — unresolved items the wiki should track.

## Progressive disclosure

The wiki is organized so Claude can answer most questions cheaply:

1. `_index.md` — one entry per page with a one-sentence teaser (the first
   sentence of that page's `## Summary`). Read this first for any query;
   it's the triage layer.
2. Each page's `## Summary` is positioned first so `Read <page> limit: 40`
   is enough when the Summary is all you need.
3. Only read the full page when the Summary doesn't resolve the query.

When creating or updating pages, keep `Summary` near the top and write its
first sentence so it stands alone as a page teaser — that sentence is the
single source of truth for the index.
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

## Promoted pages

Pages created from a promoted chat answer (not from raw ingest) are marked so
they can be distinguished from primary-source pages:

- Location: `pages/promoted/` (separate folder, never mixed into `pages/` proper).
- Filename starts with `q-` (e.g. `pages/promoted/q-foo.md`).
- Frontmatter has `origin: query-promotion` and `promoted_from_question: "..."`.
- Body opens with `> [!info] Promoted from a query. Verify against source pages before citing.`
- `_index.md` tags the entry `(promoted)`.

These pages are LLM-synthesized from other wiki pages and should be treated as
secondary until their claims are verified against primary sources.

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
- **Note on PDF originals:** A PDF file in `raw/` is considered incorporated if its
  corresponding `.extracted.md` counterpart is cited by at least one wiki page.
  Do not flag uncited PDFs as lint errors when their extracted versions are cited.

Write findings to a fresh `_lint-report.md` and append a one-line summary to `_log.md`.
