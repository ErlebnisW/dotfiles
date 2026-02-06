# Paper Selector - Instructions

## Scoring Protocol

For each candidate paper, evaluate against 6 criteria. Score each criterion independently, then compute the weighted composite score.

**Domain-Conditional Scoring:** The scoring criteria and weights differ between STEM and HSS domains. Use STEM scoring for `domain = stem` and HSS scoring for `domain = hss`. For `domain = auto`, apply the scoring system that matches each paper's origin (STEM sources → STEM scoring, HSS sources → HSS scoring).

### Criterion 1: Novelty Score (0-10, Weight: 20%)

Evaluate how new and original the paper's approach is.

| Score | Description |
|-------|-------------|
| 9-10 | Introduces a fundamentally new paradigm, framework, or way of thinking |
| 7-8 | Novel combination of existing ideas that yields surprising results |
| 5-6 | Meaningful extension or improvement of existing methods |
| 3-4 | Incremental improvement with limited novelty |
| 1-2 | Largely replicates existing work with minor modifications |
| 0 | No discernible novelty |

**Signals of high novelty:**
- New problem formulation
- Unexpected connections between fields
- Counter-intuitive findings
- New theoretical framework
- First to apply technique X to domain Y with non-trivial adaptation

**Signals of low novelty:**
- "We apply X to Y" with standard pipeline
- Hyperparameter tuning of existing methods
- Benchmark-only papers with no methodological contribution

### Criterion 2: Impact Potential (0-10, Weight: 20%)

Evaluate how likely this paper is to influence future work in the field.

| Score | Description |
|-------|-------------|
| 9-10 | Will likely be cited 500+ times; changes how people think about the problem |
| 7-8 | Will likely be cited 100+ times; introduces widely-adopted technique |
| 5-6 | Will likely be cited 50+ times; solid contribution to an active area |
| 3-4 | Will be cited by a niche community; limited broader impact |
| 1-2 | Unlikely to be widely cited or adopted |
| 0 | No discernible impact potential |

**Signals of high impact:**
- Addresses a widely-felt pain point
- Simple, elegant solution that others can easily adopt
- Accompanied by open-source code and models
- From a lab with a track record of influential work
- Already generating discussion on social media/forums

### Criterion 3: Methodological Rigor (0-10, Weight: 15%)

Evaluate the quality of the experimental setup and evaluation.

| Score | Description |
|-------|-------------|
| 9-10 | Comprehensive experiments: multiple baselines, ablations, error analysis, statistical significance |
| 7-8 | Strong experiments: good baselines, ablations present, reproducible |
| 5-6 | Adequate experiments: reasonable baselines, some ablations |
| 3-4 | Weak experiments: missing key baselines or ablations |
| 1-2 | Poor experiments: unfair comparisons, cherry-picked results |
| 0 | No experiments or evaluation |

**Check for:**
- Comparison against strong, recent baselines (not just 2+ year old methods)
- Ablation studies that isolate the contribution of each component
- Error analysis or failure case discussion
- Statistical significance or confidence intervals
- Reproducibility information (code, hyperparameters, compute budget)

### Criterion 4: Relevance (0-10, Weight: 25%)

Evaluate how closely the paper relates to the user's specified topic.

| Score | Description |
|-------|-------------|
| 9-10 | Directly addresses the exact topic; core contribution is in this area |
| 7-8 | Closely related; main method/finding is applicable to the topic |
| 5-6 | Related; some components or findings are relevant |
| 3-4 | Tangentially related; only a subsection applies |
| 1-2 | Loosely related; requires significant stretching to connect |
| 0 | Not relevant |

**Relevance assessment strategy:**
- Does the paper's title mention the topic or its synonyms?
- Is the topic central to the paper's contribution or just mentioned?
- Would a researcher working on this topic find the paper in their normal literature review?
- Could the paper's methods or findings be directly applied to work on this topic?

### Criterion 5: Citation Momentum (0-10, Weight: 10%)

Evaluate the early attention and citation velocity of the paper.

| Score | Description |
|-------|-------------|
| 9-10 | Viral attention; 50+ citations within first month; trending on social media |
| 7-8 | Strong early citations (20-50 in first month); discussed in major forums |
| 5-6 | Moderate attention; 5-20 early citations; some social media discussion |
| 3-4 | Limited attention; 1-5 citations; minimal discussion |
| 1-2 | No citations yet but paper is very recent (< 1 week old) |
| 0 | No citations and paper has been out for weeks |

**Note:** For very recent papers (< 7 days), score based on:
- Author reputation and lab prestige
- Social media buzz (Twitter/X, Reddit r/MachineLearning)
- Whether it was posted on trending lists (HuggingFace daily papers, Papers With Code)

### Criterion 6: Venue Quality (0-5, Weight: 10%)

Award bonus points based on publication venue.

| Score | Venue |
|-------|-------|
| 5 | Top-tier: NeurIPS, ICML, ICLR, ACL, EMNLP, CVPR, ICCV, ECCV, AAAI (oral/spotlight) |
| 4 | Top-tier poster or strong second-tier: NAACL, COLING, WACV, AISTATS |
| 3 | Reputable venue: workshops at top conferences, JMLR, TACL |
| 2 | arXiv preprint from a reputable lab |
| 1 | arXiv preprint from unknown authors |
| 0 | Unknown or non-peer-reviewed source |

## HSS Scoring System

When `domain = hss`, use the following adapted criteria. Criteria 1-4 are structurally similar to STEM but with different interpretation guidelines. Criteria 5-6 have HSS-specific definitions.

### HSS Criterion 1: Novelty Score (0-10, Weight: 15%)

Evaluate how original the paper's theoretical contribution or analytical perspective is.

| Score | Description |
|-------|-------------|
| 9-10 | Proposes a fundamentally new theoretical framework or paradigm |
| 7-8 | Novel analytical perspective or creative application of existing theory to new domain |
| 5-6 | Meaningful extension of existing theoretical work with new evidence or cases |
| 3-4 | Applies established framework to a new but unsurprising case |
| 1-2 | Largely repeats existing arguments with minor updates |
| 0 | No discernible novelty |

**Signals of high novelty (HSS):**
- New theoretical construct or concept proposed
- Cross-disciplinary theoretical synthesis
- Challenges established consensus with compelling evidence
- Novel use of historical sources or fieldwork data
- New periodization or interpretive framework

### HSS Criterion 2: Impact Potential (0-10, Weight: 20%)

Evaluate the paper's potential to advance the discipline or influence policy/practice.

| Score | Description |
|-------|-------------|
| 9-10 | Will reshape how the field understands a core issue; potential policy impact |
| 7-8 | Significant contribution that will be widely cited and discussed |
| 5-6 | Solid contribution to an active scholarly debate |
| 3-4 | Useful but incremental contribution to a niche area |
| 1-2 | Limited scholarly or practical impact |
| 0 | No discernible impact |

**Signals of high impact (HSS):**
- Addresses a widely debated social or policy issue
- Provides new evidence for a contested historical or social question
- Published in a top-tier C刊 (CSSCI core journal)
- Author is a recognized authority in the field
- Already discussed in academic WeChat public accounts or media

### HSS Criterion 3: Methodological Rigor (0-10, Weight: 15%)

Evaluate the quality of argumentation, evidence, and analytical method.

| Score | Description |
|-------|-------------|
| 9-10 | Exemplary: rigorous logic, comprehensive evidence, transparent methodology |
| 7-8 | Strong: well-structured argument, adequate evidence, clear methodology |
| 5-6 | Adequate: reasonable argument with some gaps in evidence |
| 3-4 | Weak: logical gaps, insufficient evidence, unclear methodology |
| 1-2 | Poor: unsupported claims, methodological confusion |
| 0 | No discernible methodological framework |

**Check for (HSS):**
- Logical coherence of the argumentative structure
- Quality and provenance of primary sources (archival materials, fieldwork data, statistical data)
- Appropriate theoretical framework for the research question
- Consideration of counter-arguments and alternative interpretations
- Transparency about limitations of sources and methods

### HSS Criterion 4: Relevance (0-10, Weight: 25%)

Same as STEM Criterion 4. Evaluate how closely the paper relates to the user's specified topic.

### HSS Criterion 5: Academic Reach (0-10, Weight: 10%)

Evaluate the paper's scholarly dissemination and discussion, replacing STEM's "Citation Momentum."

| Score | Description |
|-------|-------------|
| 9-10 | Widely discussed: high citations, reprinted in 《新华文摘》/《中国社会科学文摘》/人大复印资料 |
| 7-8 | Strong dissemination: notable citations, discussed in academic WeChat accounts |
| 5-6 | Moderate reach: some citations, occasional academic media mentions |
| 3-4 | Limited reach: few citations, minimal external discussion |
| 1-2 | Very new paper with no citations yet but from established scholar |
| 0 | No citations and no discussion after extended period |

**Note:** For recent papers (< 3 months), score based on:
- Author's scholarly reputation and institutional prestige
- Journal tier and visibility
- Whether discussed in major academic WeChat public accounts (学术公众号)
- Whether selected for reprinting by 人大复印资料 or similar

### HSS Criterion 6: Journal Quality (0-5, Weight: 15%)

Award points based on the Chinese journal tier system. Weight is increased from STEM's 10% to 15% because journal reputation carries more weight in HSS evaluation.

| Score | Journal Tier |
|-------|-------------|
| 5 | Top-tier C刊: 《中国社会科学》《历史研究》《经济研究》《法学研究》《政治学研究》《社会学研究》《哲学研究》《文学评论》《教育研究》 |
| 4 | CSSCI source journals (核心版 / 来源期刊) |
| 3 | CSSCI extended edition journals (扩展版) |
| 2 | PKU core journals (北大核心) that are not CSSCI |
| 1 | Regular academic journals (普通学术期刊) |
| 0 | Non-academic sources |

**For English-language HSS papers**, use the STEM venue quality scale (adapted):
| Score | Venue |
|-------|-------|
| 5 | Top-tier: SSCI Q1 journals, top university presses |
| 4 | SSCI Q2 or A&HCI indexed journals |
| 3 | SSCI Q3-Q4 or ESCI journals |
| 2 | Peer-reviewed but non-indexed journals |
| 1 | Working papers from reputable institutions |
| 0 | Non-peer-reviewed sources |

## Composite Score Calculation

**STEM Composite:**
```
Composite = (Novelty/10 * 20) + (Impact/10 * 20) + (Rigor/10 * 15) +
            (Relevance/10 * 25) + (Momentum/10 * 10) + (Venue/5 * 10)
```

**HSS Composite:**
```
Composite = (Novelty/10 * 15) + (Impact/10 * 20) + (Rigor/10 * 15) +
            (Relevance/10 * 25) + (AcademicReach/10 * 10) + (JournalQuality/5 * 15)
```

Maximum possible score: 100

## Selection Process

1. Score all candidate papers
2. Sort by composite score (descending)
3. Select top N papers
4. For each selected paper, write a 1-2 sentence selection rationale explaining the key reason it was chosen

## Selection Rationale Guidelines

The rationale should:
- Highlight what makes this paper stand out from the others
- Mention the strongest scoring criterion
- Be specific (not generic like "this paper is important")

**Good example:** "Selected for its novel approach to test-time compute scaling using tree search, which achieved SOTA on MATH benchmark while using 4x less compute than the closest competitor."

**Bad example:** "This is an important paper with good results."

## Output Format

```markdown
## Paper Selection: Top N for "[topic]"

### #1: [Paper Title] (Score: XX/100)
**Scores:** Novelty: X/10 | Impact: X/10 | Rigor: X/10 | Relevance: X/10 | Momentum: X/10 | Venue: X/5
**Rationale:** [1-2 sentences]

### #2: [Paper Title] (Score: XX/100)
...
```
