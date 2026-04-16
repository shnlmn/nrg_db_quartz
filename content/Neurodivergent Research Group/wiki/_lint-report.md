# Wiki Lint Report

**Generated:** 2026-04-15 (full audit)
**Scope:** 145 pages on disk (142 in `pages/`, 3 in `pages/promoted/`) · 37 raw files · `_index.md` · `_log.md`

---

## 1. Stale Wikilinks — Promoted Page Moves ⚠️ HIGH PRIORITY

Two pages were moved to `pages/promoted/` and renamed. The `_index.md` was updated but **33 page bodies were not**. All links below resolve to non-existent locations.

### `[[formatting-building-experience-questions]]` → `[[promoted/q-formatting-building-experience-questions]]`

27 pages contain this broken link:

| Page |
|------|
| `pages/promoted/q-built-environment-questions-autistic-adults.md` |
| `pages/participatory-research.md` |
| `pages/subjective-sensory-sensitivities.md` |
| `pages/sensory-responsive-environments-framework.md` |
| `pages/inclusive-research-methods.md` |
| `pages/design-from-sensorial-margins.md` |
| `pages/sensory-processing-dysfunction.md` |
| `pages/place-preference.md` |
| `pages/sensory-survey-design.md` |
| `pages/neuro-cognitive-trait-interaction-model.md` |
| `pages/psychological-safety-in-research.md` |
| `pages/sensory-quadrants.md` |
| `pages/envides.md` |
| `pages/rades.md` |
| `pages/emotional-experience-in-architecture.md` |
| `pages/sensory-experience-in-architecture.md` |
| `pages/environmental-experience.md` |
| `pages/communication-preferences.md` |
| `pages/monotropic-attention.md` |
| `pages/executive-functioning.md` |
| `pages/cognitive-load.md` |
| `pages/multi-sensory-environment-evaluation.md` |
| `pages/sensory-walk-questionnaire.md` |
| `pages/check-all-that-apply.md` |
| `pages/alexithymia.md` |
| `pages/double-empathy-problem.md` |
| `pages/recall-bias.md` |

### `[[designing-spaces-for-neurodivergent-people]]` → `[[promoted/q-designing-spaces-for-neurodivergent-people]]`

6 pages contain this broken link:

| Page |
|------|
| `pages/sensory-responsive-environments-framework.md` |
| `pages/biophilic-design.md` |
| `pages/design-from-sensorial-margins.md` |
| `pages/salutogenic-design.md` |
| `pages/sensory-zoning.md` |
| `pages/neuro-inclusive-design.md` |

**Fix:** Replace `[[formatting-building-experience-questions]]` with `[[promoted/q-formatting-building-experience-questions]]` and `[[designing-spaces-for-neurodivergent-people]]` with `[[promoted/q-designing-spaces-for-neurodivergent-people]]` across all affected pages.

---

## 2. Source Path Mismatch — Bernard et al. Filename ⚠️ HIGH PRIORITY

9 pages cite the Bernard et al. raw source using **curly double-quote** characters (`"` / `"`, Unicode U+201C/U+201D) in the filename, but the actual file in `raw/` uses **curly single-quote** characters (`'` / `'`, Unicode U+2018/U+2019).

**Incorrect path in `sources:` frontmatter and body wikilinks:**
```
raw/Not your "typical" research_ Inclusion ethics in neurodiversity scholarship _ Industrial and Organizational Psychology.md
```

**Actual filename:**
```
raw/Not your 'typical' research_ Inclusion ethics in neurodiversity scholarship _ Industrial and Organizational Psychology.md
```

Affected pages:

| Page |
|------|
| `pages/neurodiversity-paradigm.md` |
| `pages/inclusive-research-methods.md` |
| `pages/participatory-research.md` |
| `pages/lived-experience.md` |
| `pages/extractive-research.md` |
| `pages/reflexivity.md` |
| `pages/bernard-et-al-2023-inclusion-ethics.md` |
| `pages/canary-code.md` |
| `pages/ludmila-praslova.md` |

**Fix:** In each page's `sources:` YAML and body wikilinks, replace the curly double-quote characters with curly single-quotes to match the actual filename.

---

## 3. Orphan Pages (2 files)

Pages present on disk that are **not listed in `_index.md`** and receive no inbound wikilinks.

### `pages/Untitled.md`
- Completely empty (1 blank line); no frontmatter, no content, no sources.
- Not indexed; no inbound links.
- **Fix:** Delete file.

### `pages/Experience of Multisensory Environments in Public Space among People with Visual Impairment.md`
- Superseded by `pages/jenkins-et-al-2015-multisensory-visual-impairment.md` per the 2026-04-15 lint-apply.
- Not in `_index.md`; no inbound wikilinks in any current page (all links were updated to the replacement page).
- Listed as pending manual deletion in the previous lint report but still present on disk.
- Content is a proper subset of `jenkins-et-al-2015-multisensory-visual-impairment.md`.
- **Fix:** Delete file.

---

## 4. Naming Convention Violation (1 file)

| Current filename | Required (schema) | Status |
|-----------------|-------------------|--------|
| `pages/IDEAS.md` | `pages/ideas.md` | Functionally resolves on Windows (case-insensitive FS); `_index.md` correctly references `[[ideas]]`. Not broken in Obsidian, but violates kebab-case convention. |

Note: `pages/TEACCH.md` was successfully renamed to `pages/teacch.md` (resolved since last lint) ✓

**Fix:** Rename `IDEAS.md` → `ideas.md` manually (the filesystem will update in place on Windows if done via Explorer or a rename command outside the wiki tools).

---

## 5. Invalid Log Timestamps (3 entries)

Three `_log.md` entries carry impossible timestamps (hours > 23), suggesting a sequential counter was used instead of wall-clock time:

| Entry | Timestamp | Likely intended time |
|-------|-----------|---------------------|
| Promoted page migration | `2026-04-15 34:00` | after 33:00 |
| Query-promotion: Built Environment Questions | `2026-04-15 33:00` | after 32:00 |
| Ingest: Bernard et al. 2023 | `2026-04-15 32:00` | after 31:00 |

Schema requires `## YYYY-MM-DD HH:MM — <operation>` (24-hour clock). These entries are still append-only and accurate in content, but make chronological lookup unreliable.

**Fix:** The log is append-only; add a correction note at the top of the affected entries on next edit, or accept as historical artefact.

---

## 6. Empty Page Without Sources (1)

| Page | Issue |
|------|-------|
| `pages/Untitled.md` | Empty file — no frontmatter, no `sources:`, no content |

(Same as §3 — deletion resolves both findings.)

---

## 7. Uncited PDF Originals (10) — LOW PRIORITY (carried forward)

Ten PDF originals in `raw/` have no direct citations in wiki pages. Each has a corresponding `.extracted.md` that IS cited. No new PDFs since the last audit.

| PDF | Extracted version (cited) |
|-----|--------------------------|
| `raw/fpsyg-15-1303397.pdf` | `raw/fpsyg-15-1303397.extracted.md` ✓ |
| `raw/land-13-00636-v2.pdf` | `raw/land-13-00636-v2.extracted.md` ✓ |
| `raw/ijerph-12-08644.pdf` | `raw/ijerph-12-08644.extracted.md` ✓ |
| `raw/parker-et-al-2024-...pdf` | `raw/parker-et-al-2024-...extracted.md` ✓ |
| `raw/NAIT-Guide-...-2022.pdf` | `raw/NAIT-Guide-...-2022.extracted.md` ✓ |
| `raw/1-s2.0-S2666374025000597-main.pdf` | `raw/1-s2.0-S2666374025000597-main.extracted.md` ✓ |
| `raw/dark-2025-...pdf` | `raw/dark-2025-...extracted.md` ✓ |
| `raw/Sensory_Responsive_Environments_...pdf` | `raw/Sensory_Responsive_Environments_...extracted.md` ✓ |
| `raw/IJEE1353.pdf` | `raw/IJEE1353.extracted.md` ✓ |
| `raw/Participatory_Design_and_Design_for_Valu.pdf` | `raw/Participatory_Design_and_Design_for_Valu.extracted.md` ✓ |

**Recommendation:** Add a note to `_schema.md` clarifying that PDF originals are implicitly covered by their `.extracted.md` counterparts.

---

## 8. No Issues Found

| Category | Result |
|----------|--------|
| Contradictions between pages | None detected |
| Stale claims (source file removed) | None — all cited raw files exist on disk |
| Pages without sources (other than Untitled.md) | None — 144 pages have `sources:` populated |
| Raw `.md` sources uncited by any wiki page | None — all 27 raw `.md` files are cited |
| Index vs. file discrepancies | None beyond the orphans in §3 |
| Invalid `type:` values | None — all pages use schema-valid types |

---

## Summary Table

| # | Category | Count | Severity | Action |
|---|----------|-------|----------|--------|
| 1 | Stale wikilinks (promoted moves) | 33 pages | High | Update links in all 33 pages |
| 2 | Source path mismatch (Bernard et al.) | 9 pages | High | Fix quote chars in YAML + body |
| 3 | Orphan pages | 2 files | Medium | Delete both files |
| 4 | Naming convention violation | 1 file | Low | Rename IDEAS.md → ideas.md |
| 5 | Invalid log timestamps | 3 entries | Low | Cosmetic; accept or annotate |
| 6 | Empty page without sources | 1 (same as §3) | Medium | Delete file |
| 7 | Uncited PDF originals | 10 PDFs | Low | Document in `_schema.md` |
| 8 | Contradictions, stale claims, orphans (other), uncited raw .md | 0 | — | None required |
