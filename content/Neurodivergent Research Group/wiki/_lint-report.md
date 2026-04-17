# Wiki Lint Report

**Updated:** 2026-04-16 (post lint-apply)
**Scope:** 145 pages on disk (142 in `pages/`, 3 in `pages/promoted/`) · 37 raw files

---

## Remaining Issues

### 1. Orphan Pages Requiring Manual Deletion ⚠️ MEDIUM

Two files are present on disk but not in `_index.md` and receive no inbound wikilinks.
Both require filesystem deletion — no Bash available to do this automatically.

| File | Reason to delete |
|------|-----------------|
| `pages/Untitled.md` | Empty file (1 blank line); no frontmatter, no content, no sources |
| `pages/Experience of Multisensory Environments in Public Space among People with Visual Impairment.md` | Superseded by `pages/jenkins-et-al-2015-multisensory-visual-impairment.md`; content is a subset; all inbound links updated |

**Fix:** Delete both files manually via Explorer or shell.

---

### 2. Naming Convention Violation — LOW

| Current filename | Required (schema) |
|-----------------|-------------------|
| `pages/IDEAS.md` | `pages/ideas.md` |

`_index.md` already references `[[ideas]]` correctly. Functionally resolves on Windows (case-insensitive FS) but violates kebab-case convention.

**Fix:** Rename `IDEAS.md` → `ideas.md` manually via Explorer or shell.

---

### 3. Invalid Log Timestamps — LOW (historical artefact)

Three `_log.md` entries carry impossible timestamps (hours > 23):

| Entry                                        | Timestamp          |
| -------------------------------------------- | ------------------ |
| Promoted page migration                      | `2026-04-15 34:00` |
| Query-promotion: Built Environment Questions | `2026-04-15 33:00` |
| Ingest: Bernard et al. 2023                  | `2026-04-15 32:00` |

Content is accurate. Accepted as historical artefact per 2026-04-16 lint-apply.

---

## Resolved Since Last Report

| # | Finding | Resolution |
|---|---------|-----------|
| §1 | Stale wikilinks (33 pages, 2 promoted moves) | Fixed — all links updated to `promoted/` paths |
| §2 | Source path mismatch — Bernard et al. curly quotes (9 pages) | Fixed — curly double-quotes replaced with curly single-quotes in all 9 pages |
| §6 | Empty page without sources (`Untitled.md`) | Pending deletion (same as §1 above) |
| §7 | Uncited PDF originals (10 PDFs) | Documented in `_schema.md` — PDFs covered by `.extracted.md` counterparts |