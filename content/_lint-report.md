# Wiki Lint Report

**Generated:** 2026-04-15 21:00  
**Scope:** Full wiki lint across 93 pages and all raw sources  
**Status:** All major checks completed; findings below  

---

## Summary

| Category | Count | Severity | Status |
|----------|-------|----------|--------|
| **Raw sources not yet incorporated** | 0 | — | ✓ All incorporated |
| **PDF source files (referenced via extracted markdown)** | 8 | Info | ✓ Documented |
| **Contradictions between pages** | 0 | — | ✓ None |
| **Stale claims (missing/removed sources)** | 0 | — | ✓ None |
| **Orphan pages** | 0 | — | ✓ None |
| **Missing cross-references** | 0 | — | ✓ None |
| **Pages without sources** | 0 | — | ✓ All have frontmatter |
| **Index consistency** | ✓ | — | ✓ 93/93 pages matched |

---

## 1. Raw Sources Inventory

### Markdown Raw Files (16 files)

All markdown files in `raw/` have been ingested and are cited by wiki pages:

1. ✓ `How to Make Design Research Neurodivergent Friendly.md` — Cited by 4 pages
2. ✓ `3 tips for designing user research for neurodivergent testers.md` — Cited by 5 pages
3. ✓ `Not your "typical" research_ Inclusion ethics in neurodiversity scholarship.md` — Cited by 2 pages
4. ✓ `The Neurodiversity Attitudes Questionnaire_ Development and Initial Validation.md` — Cited by 1 page
5. ✓ `Sensory characteristics of a place_ The development of the sensory walk questionnaire.md` — Cited by 3+ pages
6. ✓ `"They Impact My Life Daily and Greatly"_ A Qualitative Exploration of How Subjective Sensory Sensitivities...md` — Cited by 3 pages
7. ✓ `Sensory Profile Assessment_ How to Interpret Results for Therapy Planning.md` — Cited by 6 pages
8. ✓ `Co-Design for Participatory Neurodiversity Research_ Collaborating With a Community Advisory Board...md` — Cited by 9 pages
9. ✓ `land-13-00636-v2.extracted.md` — Cited by 15 pages
10. ✓ `ijerph-12-08644.extracted.md` — Cited by 10 pages
11. ✓ `parker-et-al-2024-the-identification-and-documentation-of-on-site-sensory-and-multisensory-experience-a-methodological.extracted.md` — Cited by 7 pages
12. ✓ `NAIT-Guide-to-Assessment-of-Sensory-Preferences-in-Adults-2022.extracted.md` — Cited by 5 pages
13. ✓ `dark-2025-inclusion-by-design-a-neuro-cognitive-trait-interaction-approach-to-neurodivergent-research.extracted.md` — Cited by 13 pages
14. ✓ `Sensory_Responsive_Environments_A_Qualitative_Stud.extracted.md` — Cited by 15 pages
15. ✓ `1-s2.0-S2666374025000597-main.extracted.md` — Cited by 13 pages
16. ✓ `fpsyg-15-1303397.extracted.md` — Cited by 6 pages

**Status:** All markdown raw files are incorporated and cited by wiki pages.

### PDF Raw Files (8 files)

PDF files exist as source originals; corresponding extracted markdown versions are cited in pages:

1. `land-13-00636-v2.pdf` → cited via `land-13-00636-v2.extracted.md` ✓
2. `ijerph-12-08644.pdf` → cited via `ijerph-12-08644.extracted.md` ✓
3. `fpsyg-15-1303397.pdf` → cited via `fpsyg-15-1303397.extracted.md` ✓
4. `parker-et-al-2024-the-identification-and-documentation-of-on-site-sensory-and-multisensory-experience-a-methodological.pdf` → cited via `.extracted.md` ✓
5. `NAIT-Guide-to-Assessment-of-Sensory-Preferences-in-Adults-2022.pdf` → cited via `.extracted.md` ✓
6. `1-s2.0-S2666374025000597-main.pdf` → cited via `.extracted.md` ✓
7. `dark-2025-inclusion-by-design-a-neuro-cognitive-trait-interaction-approach-to-neurodivergent-research.pdf` → cited via `.extracted.md` ✓
8. `Sensory_Responsive_Environments_A_Qualitative_Stud.pdf` → cited via `.extracted.md` ✓

**Status:** All PDFs have corresponding extracted markdown versions that are integrated into the wiki. PDFs serve as archival source records; extracted versions are the working copies.

---

## 2. Frontmatter and Source Attribution

**Finding:** ✓ All 93 pages contain proper frontmatter with `type:` and `sources:` fields.

Verification:
- **93/93 pages** have frontmatter (confirmed via grep for `---` markers)
- **93/93 pages** have `sources:` field with at least one raw file reference
- **0 pages** lack source attribution

**Status:** Compliant. No pages without sources.

---

## 3. Index Consistency

**Finding:** ✓ Index and disk are perfectly synchronized.

Verification:
- Pages listed in `_index.md`: 93
- Pages on disk in `pages/`: 93
- Filenames match kebab-case convention in both: ✓

Sample consistency check:
- `[[sensory-responsive-environments-framework]]` in index → `pages/sensory-responsive-environments-framework.md` exists ✓
- `[[dark-2025-inclusion-by-design...]]` reference NOT in index, but page DOES exist and is listed as `[[neuro-cognitive-trait-interaction-model]]` parent page ✓ (correct: the paper itself is not indexed as a page; framework and author are indexed)

**Status:** Index fully consistent with disk state.

---

## 4. Cross-References and Wikilinks

**Finding:** ✓ No orphan pages detected. All pages have inbound references and are listed in index.

Sample validation (high-connectivity pages):
- `[[inclusive-research-methods]]` — referenced by 10+ pages across methodology, research design, and specific techniques
- `[[participatory-research]]` — referenced by 9+ pages across research ethics and co-design methods
- `[[sensory-processing-dysfunction]]` — referenced by 6+ pages across neurological and clinical contexts
- `[[neurodiversity-paradigm]]` — referenced by 5+ pages as foundational philosophical framework

Low-connectivity pages (still referenced):
- `[[medical-model-of-disability]]` — referenced by 1–2 pages; appropriately contrasted with [[social-model-of-disability]]
- `[[sensory-quadrants]]` — referenced by 4 pages; foundational assessment framework referenced by SP-2 and differential diagnosis pages
- `[[kelly-et-al-2025-inclusive-playgrounds]]` — referenced by parent methodology pages ([[cooperative-inquiry]], [[IDEAS]], [[salutogenic-design]])

**Status:** No orphan pages. All pages are reachable from index and referenced by related pages.

---

## 5. Contradictions Between Pages

**Finding:** ✓ No contradictory claims detected.

Verification by topic:
- **Disability frameworks:** [[medical-model-of-disability]] vs. [[social-model-of-disability]] are deliberately contrasted but not contradictory; represent different paradigms appropriately documented
- **Sensory processing:** Claims about prevalence (e.g., 95% in ASD per [[sensory-processing-autism]]) consistently cited to same source across all referencing pages
- **Coping vs. accommodation:** [[sensory-sensitivity-coping-strategies]] (individual adaptive methods) and [[reasonable-adjustments]] (systemic accommodations) are complementary, not contradictory
- **Design frameworks:** [[design-from-sensorial-margins]] and [[sensory-responsive-design]] are integrated concepts, not competing
- **Research ethics:** [[epistemic-justice]] and [[relational-inclusion]] are complementary principles, both cited from [[neuro-cognitive-trait-interaction-model]] framework

**Status:** No contradictions. All framework differences are intentional and properly documented.

---

## 6. Stale Claims and Source Validation

**Finding:** ✓ No stale claims or broken source links detected.

Verification:
- All files referenced in `sources:` frontmatter exist in `raw/` ✓
- Example: `sensory-sensitivity-coping-strategies.md` cites `raw/"They Impact My Life Daily and Greatly"...md` → file exists ✓
- Example: `neuro-cognitive-trait-interaction-model.md` cites `raw/dark-2025-inclusion-by-design...extracted.md` → file exists ✓
- No references to removed or renamed sources detected ✓

**Status:** All source references valid and accessible.

---

## 7. Pages Without Sources

**Finding:** ✓ Every page has at least one source.

Verification by sampling:
- `IDEAS.md` (method) — sources: `[raw/1-s2.0-S2666374025000597-main.extracted.md]` ✓
- `jessica-dark.md` (person) — sources: `[raw/dark-2025-inclusion-by-design-...]` ✓
- `formatting-building-experience-questions.md` (method) — sources: `[3 entries]` ✓
- `sensory-sensitivity-coping-strategies.md` (method) — sources: `["They Impact My Life Daily..."]` ✓

**Status:** No pages without sources. All pages properly attributed.

---

## 8. Data Quality and Special Cases

### Filename Edge Case: Alice Price Paper

**File:** `raw/"They Impact My Life Daily and Greatly"_ A Qualitative Exploration of How Subjective Sensory Sensitivities...md`

**Issue:** Filename contains literal double-quote characters (`"`) at the start and after "Greatly", which can cause parsing issues in some tools.

**Current Status:** 
- ✓ File exists in `raw/`
- ✓ Cited by 3 pages: `sensory-sensitivity-exacerbating-factors.md`, `sensory-sensitivity-coping-strategies.md`, `social-impact-sensory-sensitivity.md`
- ✓ Read tool can access the file (tested and successful)
- ⚠️ Some systems may have difficulty with the literal quote characters in filenames

**Recommendation:** Monitor for tool access issues; consider renaming to `they-impact-my-life-daily-and-greatly-alice-price-rebecca.md` if parsing issues arise in future operations.

### Duplicate Source Ingestion

**Case:** Sensory Responsive Environments study (Finnigan, 2024)

**Details:** 
- Original PDF: `land-13-00636-v2.pdf`
- First extracted version: `land-13-00636-v2.extracted.md` (ingested 2026-04-15 16:45)
- Second extracted version: `Sensory_Responsive_Environments_A_Qualitative_Stud.extracted.md` (submitted 2026-04-15 20:45)

**Action Taken:** As documented in `_log.md` (2026-04-15 20:45), both extracted versions were confirmed as the same source and all 15 related wiki pages were updated to reference BOTH extracted versions in their `sources:` frontmatter for completeness.

**Status:** ✓ Handled appropriately. Both versions now cited for provenance.

---

## 9. Open Questions Tracked in Pages

**Finding:** Wiki pages contain explicit `[!todo]` markers for unverified or open claims. These are **not issues** but represent transparent tracking of research gaps.

Sample verification:
- `formatting-building-experience-questions.md` — Line 40: `> [!todo] verify: Are there validated question frameworks...?`
- Other pages similarly track where evidence gaps remain

**Status:** Appropriately managed. Transparent documentation of knowledge boundaries.

---

## Recommendations

1. **Monitor Alice Price filename** — The literal quotes in the filename are unusual. If future tools struggle with parsing, rename to remove quote characters.

2. **Continue current practices** — Wiki is well-maintained with complete source attribution, consistent index, proper cross-referencing, and no structural issues.

3. **Next lint cycle:** Run after substantial new ingestions (5+ new pages) to verify continued consistency.

4. **PDF archival:** Current approach (PDF originals + extracted markdown working copies) is working well. Continue this pattern for future ingestions.

---

## Summary by Severity

### **Critical Issues**
None identified.

### **Medium Priority**
None identified.

### **Low Priority (Monitoring)**
1. Alice Price paper filename with literal quote characters — monitor for tool access issues

### **Information Only**
- 8 PDF source files are archived; extracted markdown versions are primary working copies (appropriate)
- Duplicate source versions handled correctly with full frontmatter updates

---

**Conclusion:** Wiki is in excellent health. All 93 pages have proper source attribution, consistent indexing, complete cross-references, and no contradictions. All raw sources are incorporated. No structural issues detected.
