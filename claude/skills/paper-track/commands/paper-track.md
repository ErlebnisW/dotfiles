---
description: Track and analyze the latest papers on a specified topic within a time window
argument-hint: "[topic] [--days N] [--top N] [--lang en|zh] [--domain stem|hss|auto]"
allowed-tools: Task, WebSearch, WebFetch, Read, Write, Glob, Grep
---

# Paper Track

Execute the full paper tracking and analysis workflow for a given topic.

## Topic

$ARGUMENTS

## Argument Parsing

Parse the following from $ARGUMENTS:
- **topic** (required): The research topic or query string
- **--days N** (default: 7): Time window in days to search for papers
- **--top N** (default: 5): Number of top papers to select and analyze
- **--lang en|zh** (default: en): Output language. "en" for English, "zh" for Chinese
- **--domain stem|hss|auto** (default: auto): Research domain. "stem" for Science/Technology/Engineering/Math, "hss" for Humanities and Social Sciences, "auto" for automatic detection based on topic keywords

If no topic is provided, ask the user to specify one.

## Workflow

### Step 1: Scope Refinement

#### Domain Detection

If `--domain auto` (default), detect the domain from topic keywords:

**HSS signals (Chinese):** 经济, 管理, 社会, 法律, 政治, 历史, 哲学, 文学, 语言, 教育, 传播, 艺术, 民族, 宗教, 人口, 考古, 新闻, 图书馆, 马克思, 伦理, 美学, 心理, 公共政策, 国际关系, 乡村振兴, 社会治理, 文化, 制度

**HSS signals (English):** sociology, economics (non-quantitative context), political science, history, philosophy, literature, linguistics, anthropology, law, education, communication studies, area studies

**STEM signals:** arXiv, model, algorithm, dataset, benchmark, neural, transformer, GPU, training, inference, code, API, machine learning, deep learning, computer vision, NLP

**Resolution:**
- If only HSS signals → domain = hss
- If only STEM signals → domain = stem
- If both or ambiguous → domain = auto (search both source sets)
- `--domain` parameter always overrides auto-detection

If the topic is broad (single word, very general term like "LLMs" or "transformers"), ask 2-3 clarifying questions:
- What specific aspect interests you most? (e.g., efficiency, safety, multimodal, reasoning)
- Any preferred venues or research groups to prioritize?
- Should we include adjacent/related topics?

If the topic is already specific (e.g., "chain-of-thought reasoning in small language models"), proceed directly.

Create the output directory: `RESEARCH/paper-track/[topic-slug]/`

### Step 2: Parallel Paper Search

Deploy parallel search agents to find papers from the last N days. Use the **paper-searcher** sub-skill strategy.

**If domain = stem or auto:**

**Search Agent 1 - arXiv:**
Use WebSearch with query: `site:arxiv.org [topic] [current year]`
Also try: `arxiv.org abs [topic keywords]`

**Search Agent 2 - Semantic Scholar:**
Use WebSearch with query: `site:semanticscholar.org [topic] [current year]`

**Search Agent 3 - Google Scholar:**
Use WebSearch with query: `[topic] research paper [current year]`

**Search Agent 4 - Papers With Code:**
Use WebSearch with query: `site:paperswithcode.com [topic]`

**Search Agent 5 - HuggingFace Papers:**
Use WebSearch with query: `site:huggingface.co/papers [topic]`

**If domain = hss or auto:**

**Search Agent H1 - Baidu Scholar (百度学术):**
Use WebSearch with query: `百度学术 [topic] CSSCI [current year]`
Also try: `site:xueshu.baidu.com [topic]`

**Search Agent H2 - NCPSSD (国家哲学社会科学文献中心):**
Use WebSearch with query: `site:ncpssd.cn [topic]`
Also try: `ncpssd.cn [topic] [journal name if known]`

**Search Agent H3 - Google Scholar (Chinese mode):**
Use WebSearch with query: `[中文topic] site:cnki.net OR site:wanfangdata.com.cn [current year]`

**Search Agent H4 - CNKI metadata:**
Use WebSearch with query: `cnki [topic] CSSCI [current year]`
Also try: `知网 [topic] 核心期刊`

For each paper found, collect:
- Title
- Authors
- Date published
- Abstract (fetch via WebFetch if needed)
- Source URL (arXiv link preferred for STEM; NCPSSD/百度学术 link preferred for HSS)
- Citation count (if available)
- Journal/venue name (especially important for HSS)
- CSSCI status (for HSS papers: mark if from CSSCI source journal)

**Deduplication**:
- STEM: Remove duplicates by matching arXiv IDs or title similarity (>90% match)
- HSS: Remove duplicates by exact title match or title similarity (>85% match, since Chinese titles may have minor variants)
- Cross-domain: If auto mode finds same paper in both source sets, merge metadata

**Time filtering**: Exclude papers published before the time window (today minus N days).

### Step 3: Paper Selection

Apply the **paper-selector** sub-skill scoring criteria to rank all candidate papers.

**STEM scoring weights:**

| Criterion | Weight | Scale |
|-----------|--------|-------|
| Novelty | 20% | 0-10 |
| Impact Potential | 20% | 0-10 |
| Methodological Rigor | 15% | 0-10 |
| Relevance | 25% | 0-10 |
| Citation Momentum | 10% | 0-10 |
| Venue Quality | 10% | 0-5 |

**HSS scoring weights:**

| Criterion | Weight | Scale | HSS Notes |
|-----------|--------|-------|-----------|
| Novelty | 15% | 0-10 | Theoretical or perspective innovation |
| Impact Potential | 20% | 0-10 | Contribution to disciplinary development |
| Methodological Rigor | 15% | 0-10 | Argumentation logic, source/data quality |
| Relevance | 25% | 0-10 | Match with user's topic |
| Academic Reach | 10% | 0-10 | Citations, reprints, academic WeChat discussion |
| Journal Quality | 15% | 0-5 | CSSCI tier weighting (see paper-selector) |

Select the top N papers. For each, write a 1-sentence selection rationale.

### Step 4: Deep Analysis

For each selected paper, apply the **paper-analyzer** sub-skill to produce:

1. **Must-Read Rationale** - Why this paper matters
2. **Core Insight** - The central idea in 2-3 sentences
3. **Technical Approach** - Problem, method, key innovations
4. **Hardest Problem & Solution** - Most challenging technical hurdle and how they solved it
5. **Key Results** - Main quantitative results, SOTA comparison, ablation highlights
6. **Limitations & Open Questions** - What remains unsolved
7. **Connections** - How it relates to other recent work
8. **One-Line Summary** - Tweet-length summary

**HSS analysis uses an adapted template:**

1. **Must-Read Rationale** - Why this paper matters (same as STEM)
2. **Core Argument (核心论点)** - Central thesis or hypothesis
3. **Research Method & Materials (研究方法与材料)** - Theoretical framework, historical sources, fieldwork, data sources
4. **Key Argumentation (关键论证)** - Most brilliant chain of argument or use of evidence
5. **Core Findings & Conclusions (核心发现与结论)** - Main discoveries
6. **Limitations & Room for Discussion (局限性与商榷空间)** - Including "questions for further discussion"
7. **Scholarly Context (学术脉络)** - Position in academic history, scholars and theories in dialogue
8. **One-Line Summary** - Tweet-length summary (same as STEM)

For HSS papers, also attempt to provide full-text access links:
- NCPSSD link (free full text after registration)
- CNKI link (metadata and abstract)
- Baidu Scholar link (aggregated access)

Use WebFetch to read the paper's abstract page (arXiv abstract for STEM, NCPSSD/百度学术 for HSS, PDF if accessible) for accurate analysis.

Save each analysis to `RESEARCH/paper-track/[topic-slug]/papers/NN-paper-title-slug.md`

### Step 5: Field Synthesis

Apply the **field-synthesizer** sub-skill to produce a macro-level overview based on ALL papers found (not just the top N):

1. **Field Overview** - What is this research area about
2. **Active Research Directions** - 3-7 major themes with key papers
3. **Methodological Trends** - What techniques are gaining/losing traction
4. **Key Players & Groups** - Most active labs, companies, individuals
5. **Research Gaps** - Important unaddressed problems
6. **Opportunities & White Spaces** - Promising directions rated by impact, competition, feasibility
7. **Predictions** - Where the field is heading in 6-12 months

Save to `RESEARCH/paper-track/[topic-slug]/field_overview.md`

### Step 6: Output Generation

Generate the following files:

**README.md** - Overview with:
- Topic and search parameters
- Date of analysis
- Table of contents linking to all other files
- Quick stats (papers found, papers analyzed, time window)

**executive_summary.md** - 1-page digest with:
- Top 3 takeaways from the analysis
- Most important paper and why
- Key trend or shift in the field
- One sentence on the biggest research gap

**reading_list.md** - Prioritized reading order with:
- Ranked list of all selected papers
- Estimated reading time for each (based on page count: ~4 min/page for skimming, ~10 min/page for deep reading)
- Difficulty level (introductory / intermediate / advanced)
- Prerequisites (what you should read first)
- Reading strategy tips (which sections to focus on)

## Language Handling

If `--lang zh` is specified:
- Write ALL output sections in Chinese
- Keep paper titles and author names in their original language
- For technical terms, include both Chinese and English: "注意力机制 (Attention Mechanism)"
- The `--lang` parameter applies to all sub-skill outputs

If `--lang en` (default):
- Write all output in English

## Output Directory Structure

```
RESEARCH/paper-track/[topic-slug]/
  README.md
  executive_summary.md
  papers/
    01-paper-title.md
    02-paper-title.md
    ...
  field_overview.md
  reading_list.md
```

Begin the paper tracking process now.
