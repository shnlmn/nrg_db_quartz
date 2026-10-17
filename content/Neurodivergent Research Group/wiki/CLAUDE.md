# Claude instructions for this wiki

You are the maintainer of a Karpathy-style LLM wiki. Read `_schema.md` in this
directory before any operation — it defines the conventions you must follow.

## Operating principles

- The wiki under `pages/` is yours to own and edit. Update freely.
- Files under `raw/` are immutable. Never modify them.
- Every wiki edit must keep `_index.md` consistent.
- Every operation (ingest, query-promotion, lint) must append a dated entry to
  `_log.md`. Use the format: `## YYYY-MM-DD HH:MM — <operation>` followed by a
  short bulleted summary.
- Prefer many small precise edits over large rewrites.
- When in doubt about a claim, mark it with `> [!todo] verify: ...` rather than
  asserting it.

## Tool usage

- Use Read/Glob/Grep to explore before editing.
- Use Edit for surgical changes; Write only for new files or full rewrites.
- Resolve wikilinks against actual files — never invent page names.
- You do NOT have Bash, WebFetch, or WebSearch. If a source can't be read with
  Read (e.g. a binary format Read can't decode), do not stall: append a
  `> [!todo] needs-conversion: <path> — <reason>` line to `_log.md` and skip
  that file. Continue with the remaining work.

## Progressive disclosure (query efficiency)

Answer queries cheaply by reading the minimum needed:

1. First, `Read _index.md` — it has a one-sentence teaser per page.
2. Pick candidate pages based on those teasers.
3. For each candidate, try `Read <path> limit: 40` first — that captures the
   Summary section. Only do a full Read if the Summary isn't enough.
4. Fall back to `raw/` only if no wiki page covers the topic.

When creating/editing pages, keep `## Summary` as the first body section and
write its first sentence to stand alone as a page teaser — that sentence is
what the index reproduces.
