---
description: Generate a macro-level overview of a research field based on recent papers
argument-hint: "[topic] [--days N] [--domain stem|hss|auto] [--lang en|zh]"
allowed-tools: Task, WebSearch, WebFetch, Read, Write
---

# Field Overview

Generate a macro-level overview and landscape analysis for a research field.

## Topic

$ARGUMENTS

## Argument Parsing

- **topic** (required): The research field or area to analyze
- **--days N** (default: 30): Time window in days (default is 30 for field overviews to capture broader trends)
- **--domain stem|hss|auto** (default: auto): Research domain for source and analysis selection
- **--lang en|zh** (default: en): Output language

## Workflow

### Step 0: Domain Detection

If `--domain auto` (default), detect domain using the same keyword signals as in paper-track.md.

### Step 1: Broad Paper Collection

**For STEM fields (domain = stem or auto):**

Search broadly to capture the landscape. Deploy parallel searches:

```
WebSearch: [topic] survey paper [current year]
WebSearch: [topic] recent advances [current year]
WebSearch: site:arxiv.org [topic] [current year]
WebSearch: [topic] benchmark state-of-the-art [current year]
WebSearch: [topic] research trends [current year]
```

**If domain = stem or auto, also search for:**
- Survey/review papers on the topic (these provide excellent landscape context)
- Workshop/tutorial pages from recent conferences (NeurIPS, ICML, ICLR, ACL, CVPR)
- Blog posts from major labs (Google DeepMind, OpenAI, Meta AI, Anthropic, Microsoft Research)

**If domain = hss or auto, additionally search:**

```
WebSearch: [topic] CSSCI 综述 [current year]
WebSearch: [topic] 研究进展 研究综述 [current year]
WebSearch: 百度学术 [topic] 核心期刊 [current year]
WebSearch: site:ncpssd.cn [topic] 综述
WebSearch: [topic] 学术前沿 研究动态 [current year]
```

Also search for:
- Survey/review articles (综述/述评) in CSSCI journals
- National Social Science Fund (国家社科基金) project listings related to the topic
- Academic conference proceedings from major Chinese HSS conferences
- Scholarly discussions in academic WeChat public accounts

Collect 20-50 papers/resources for landscape analysis.

### Step 2: Cluster and Categorize

Group the collected papers into 3-7 thematic clusters:
- Identify recurring themes, methods, and problem formulations
- Note which clusters are growing vs. shrinking in activity
- Identify cross-cutting themes that span multiple clusters

### Step 3: Field Synthesis

Apply the **field-synthesizer** sub-skill framework. The framework adapts based on domain:

**For STEM fields:**

#### Section 1: Field Overview
What is this research area about? Provide 2-3 paragraphs of context suitable for a researcher adjacent to (but not deeply in) this field.

#### Section 2: Active Research Directions
List 3-7 major directions. For each:
- What the direction is about (1-2 sentences)
- Key papers and groups driving it (with links)
- Current state of progress (early/active/maturing)
- Open challenges within this direction

#### Section 3: Methodological Trends
- What techniques/approaches are gaining traction?
- What is falling out of favor and why?
- Any paradigm shifts underway?
- Common evaluation benchmarks and datasets

#### Section 4: Key Players & Groups
- Most active research labs (academic and industry)
- Prolific individual researchers
- Notable collaborations or research programs
- Emerging groups to watch

**HSS-specific adaptations for Key Players:**
- **Universities & Institutes**: Focus on Chinese universities with strong HSS programs (e.g., 北京大学, 中国人民大学, 复旦大学, 武汉大学, 中山大学, 中国社会科学院) and their key departments/centers
- **Research Centers**: Identify key research centers/bases (教育部人文社科重点研究基地, 国家高端智库)
- **Scholars**: Identify field leaders by CSSCI citation metrics, National Social Science Fund major project PIs (国家社科基金重大项目首席专家), and Changjiang Scholars (长江学者)
- **Academic Platforms**: Key journals, book series, and annual conferences in the field

**For HSS fields:**

#### Section 1: Field Overview (领域概览)
Same structure as STEM but adapted to disciplinary context.

#### Section 2: Active Research Directions (主要研究方向)
List 3-7 major scholarly directions with key scholars, schools, and debates.

#### Section 3: Methodological Trends (方法论趋势)
- Rising vs. declining research methods
- Theoretical paradigm shifts
- Cross-disciplinary influences
- Common data sources and analytical approaches

#### Section 4: Key Players & Groups (核心学者与机构)
- Major research centers and institutes
- Key universities and departments
- Leading scholars and emerging scholars
- Academic schools and theoretical debates
- Funding sources and policy support

#### Section 5: Research Gaps
- Important problems that are NOT being addressed
- Where is the field collectively blind?
- Under-explored combinations of existing techniques
- Missing benchmarks or evaluation criteria

#### Section 6: Opportunities & White Spaces
For each identified opportunity:
- **Description**: What the opportunity is
- **Potential Impact**: High / Medium / Low
- **Competition Level**: High / Medium / Low
- **Feasibility for a PhD student**: High / Medium / Low
- **Why now**: What makes this timely

**HSS-specific opportunity signals:**
- National Social Science Fund (国家社科基金) annual project guide topics — these indicate national research priorities
- Central government policy documents mentioning research needs
- Gaps between Chinese and international scholarship on the same topic
- Under-explored interdisciplinary connections

#### Section 7: Predictions
Where is this field heading in 6-12 months? Be specific and actionable:
- Which directions will likely see breakthroughs?
- Which problems might get solved?
- What new problems will emerge?
- Which conferences will feature this work prominently?

### Step 4: Output

Save to `RESEARCH/paper-track/[topic-slug]/field_overview.md`.

If `--lang zh` is specified, write all content in Chinese with bilingual technical terms.

## Quality Checklist

Before finalizing, verify:
- [ ] At least 3 distinct research directions identified
- [ ] Each direction has at least 2 specific paper references
- [ ] Gaps and opportunities are specific and actionable (not generic)
- [ ] Predictions are concrete and time-bounded
- [ ] Key players section covers both academia and industry
- [ ] The overview would genuinely help a PhD student orient themselves
- [ ] For HSS: Journal quality assessed using CSSCI tier system (not impact factor)
- [ ] For HSS: Key players include Chinese universities, research centers, and scholars

Begin the field overview analysis now.
