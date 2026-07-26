# Wiki Lint Report

**Updated:** 2026-07-26
**Scope:** 191 pages on disk (186 in `pages/`, 5 in `pages/promoted/`) · 66 raw files
(including one new untracked file, `WordList_Beukelman.pdf`)

This report does not auto-fix anything — see `_schema.md` § Lint behavior.

---

## 1. Broken wikilinks — target page does not exist ⚠️ HIGH

Ten distinct link targets are referenced from wiki pages but have no
corresponding file in `pages/`. Per `_schema.md`, wikilinks must resolve
against actual files.

| Broken target | Referenced from | Likely fix |
|---|---|---|
| `[[sensory-preferences]]` | `adult-sensory-history.md`, `adult-adolescent-sensory-profile.md`, `nait-sensory-checklist.md`, `sensory-assessment-neurodevelopmental.md`, `calming-and-alerting-strategies.md` (13 occurrences, 5 pages) | High-demand concept, no page exists — candidate for new `pages/sensory-preferences.md`, or repoint to `sensory-processing-dysfunction` if synonymous |
| `[[prospect-refuge]]` | `inclusive-playground-design.md`, `kelly-et-al-2025-inclusive-playgrounds.md`, `self-regulation-in-play.md`, `sensory-responsive-design.md`, `salutogenic-design.md` (9 occurrences, 5 pages) | High-demand concept (Appleton's prospect-refuge theory) — candidate for new `pages/prospect-refuge.md` |
| `[[sensory-stacking]]` | `hyposensitivity.md`, `hypersensitivity.md`, `landscape-architecture-neurodiversity.md`, `the-sensorial-prism.md` | Candidate for new page — verify meaning against source before creating |
| `[[collaborative-analysis]]` | `cornish-et-al-2023-par-primer.md`, `participatory-action-research.md` | Verify against Cornish et al. 2023 source; new page or repoint to existing PAR-method page |
| `[[self-regulation]]` | `calming-and-alerting-strategies.md` | No parent concept page exists; `zones-of-regulation.md` and `calming-and-alerting-strategies.md` cover pieces of it — consider a parent page or repoint |
| `[[sensory-characteristics-visual-impairment]]` | `Experience of Multisensory Environments...md` (orphan, see §3), `jenkins-et-al-2015-multisensory-visual-impairment.md` | Likely should point to `visual-impairment-public-space-access` or `sensory-barriers-navigation` |
| `[[nominal-group-technique]]` | `peters-et-al-2024-co-design-evaluation.md` | Verify against source; candidate for new method page |
| `[[inclusive-design-for-all]]` | `ruth-baumeister.md` | Likely a typo for `[[neuro-inclusive-design]]` or `[[universal-design-public-space]]` |
| `[[aural-documentation-standards]]` | `soundwalk.md` | Verify against Parker et al. 2024 source; new page or repoint |
| `[[situation-based-action]]` | `van-der-velden-mortberg-pd-values.md` | Named PD guiding principle from the source (see `_log.md` 2026-04-19 27:00 entry) — candidate for new page or fold into `scandinavian-participatory-design.md` |

---

## 2. Naming convention violation — LOW (recurring, still open)

| Current filename | Required (schema) |
|---|---|
| `pages/IDEAS.md` | `pages/ideas.md` |

No separate `pages/ideas.md` exists — this is the sole file for the page,
just incorrectly cased. `_index.md` and inbound wikilinks already use the
correct-case `[[ideas]]` form and resolve fine in Obsidian, but the
filename itself still violates the kebab-case convention. Flagged in the
2026-04-15/16 lint runs; unresolved.

**Fix:** Rename `IDEAS.md` → `ideas.md` manually via Explorer or shell.

---

## 3. Orphan pages — MEDIUM (recurring, still open)

| File | Reason to delete |
|---|---|
| `pages/Experience of Multisensory Environments in Public Space among People with Visual Impairment.md` | Superseded by `pages/jenkins-et-al-2015-multisensory-visual-impairment.md` (near-identical content); not in `_index.md`; no inbound links under this filename |

`pages/Untitled.md`, flagged in earlier reports, has since been deleted —
resolved.

**Fix:** Delete the file manually via Explorer or shell.

---

## 4. Raw sources not yet incorporated

- `raw/WordList_Beukelman.pdf` — new file (untracked in git), not cited by
  any page's `sources:` frontmatter or wikilink, and has no `.extracted.md`
  counterpart. Per `_schema.md`'s PDF note this does not count as
  incorporated. Read cannot decode this PDF directly, so ingestion will
  require an extracted-text counterpart first.

All other raw files are cited either directly or via a cited
`.extracted.md` counterpart — no other uncited sources found.

---

## 5. Pages missing `## Summary` as first body section

Ten pages open with a bold-text `**Summary** — ...` line instead of the
`## Summary` heading required by `_schema.md`. All ten trace to the same
two ingest batches (Dark 2025 / AAC cluster, 2026-04-15 and 2026-07-26):

- `pages/communication-preferences.md`
- `pages/executive-functioning.md`
- `pages/monotropic-attention.md`
- `pages/neuro-cognitive-trait-interaction-model.md`
- `pages/eight-principles-of-neuro-inclusion.md`
- `pages/jessica-dark.md`
- `pages/relational-inclusion.md`
- `pages/autism-embodiment.md`
- `pages/epistemic-enablement.md`
- `pages/epistemic-justice.md`

---

## 6. Missing cross-references

- `pages/energy-suite.md` links to `[[zones-of-regulation]]` (with a note
  distinguishing the two frameworks), but `pages/zones-of-regulation.md`
  does not link back to `energy-suite`, `power-plan`, `my-energy`,
  `the-regulator`, or `pic-tool`. Both are self-regulation frameworks
  discussed in similar contexts — a backlink would help navigation.

---

## 7. Frontmatter format inconsistency (cosmetic, not a sources gap)

Roughly 60 pages write `sources:` as a multi-line YAML list
(`sources:\n  - "raw/...md"`) rather than the single-line array format shown
in `_schema.md` (`sources: [raw/source-a.pdf, raw/source-b.md]`). An initial
automated scan for empty `sources: []` matched these by mistake — manual
spot-checks (`bernard-et-al-2023-inclusion-ethics.md`, `check-all-that-apply.md`,
`epistemic-justice.md`, `smellwalk.md`) confirm every one has at least one
valid source entry. Pure formatting inconsistency, not a missing-source
issue; no action required unless the wiki wants to standardize on one style.

---

## 8. Pages without sources

None found — see §7; the earlier automated flag was a false positive
caused by a regex that didn't account for multi-line YAML lists. A
follow-up multiline check for a genuinely empty `sources:` field (nothing
before the next frontmatter key) found zero matches.

---

## 9. Contradictions between pages

None identified in this pass. Spot-checked the most recently ingested
cluster (ENERGY Suite, AAC tip sheet, Communication Boards, Core Words)
against existing self-regulation and communication pages — no conflicting
claims found. Consistent with the full audit of 2026-04-15, which also
found zero contradictions. Not exhaustively re-verified across all 191
pages this run.

---

## 10. Stale claims (sources removed or superseded)

None found — no sources have been removed from `raw/` since the last audit.

---

## 11. `_index.md` teaser check

All 191 entries in `_index.md` have a one-line teaser after the em-dash
separator. No issues found.

---

## 12. Invalid log timestamps — LOW (historical artefact, resolved status unchanged)

Three `_log.md` entries from 2026-04-15 still carry impossible timestamps
(hours 32–34, sequential counters rather than wall-clock time). Content is
accurate. Accepted as historical artefact per the 2026-04-16 lint-apply;
no further action needed.

---

## Priority order for next fix pass

1. Delete the orphan file and rename `IDEAS.md` → `ideas.md` (§2, §3) —
   pending manual filesystem action since 2026-04-15/16.
2. Resolve the 10 broken wikilinks (§1) — create missing pages or repoint
   citing pages.
3. Convert the 10 bold-`**Summary**` pages to `## Summary` headings (§5).
4. Add the `zones-of-regulation` ↔ `energy-suite` backlink (§6).
5. Ingest or flag-and-defer `raw/WordList_Beukelman.pdf` (§4).
