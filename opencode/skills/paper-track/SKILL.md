---
name: paper-track
description: "Academic paper tracking and analysis for researchers in STEM and Humanities/Social Sciences (HSS). Searches recent papers from multiple sources (arXiv, Semantic Scholar, Google Scholar for STEM; Baidu Scholar, NCPSSD, Google Scholar, CNKI for HSS) on any topic within a configurable time window (default 7 days), selects the top N must-read papers, and provides deep analysis. Supports automatic domain detection (STEM vs HSS) or manual override. Output in English or Chinese."
---

# Paper Track

## Overview

Paper Track is an academic paper tracking and analysis skill designed for researchers across STEM and Humanities/Social Sciences (HSS) disciplines. It automates the process of finding, filtering, ranking, and deeply analyzing the latest research papers on any topic within a configurable time window. The output is a structured research digest that saves hours of manual literature review.

## 5-Phase Workflow

Paper Track operates through five sequential phases:

### Phase 1: Scope
Parse the user's topic and parameters. If the topic is broad or ambiguous, use the **question-refiner** pattern to ask 2-3 clarifying questions before proceeding. Determine: specific sub-topics, preferred venues, inclusion/exclusion criteria. Detect the research domain (STEM or HSS) based on topic keywords, or use the `--domain` parameter if specified.

### Phase 2: Search
Deploy parallel search agents across multiple academic sources:

**STEM sources** (default for STEM domain):
- **arXiv** (primary for AI/ML preprints)
- **Semantic Scholar** (citation data and metadata)
- **Google Scholar** (broad academic coverage)
- **Papers With Code** (implementation-focused papers)
- **HuggingFace Papers** (trending ML papers)

**HSS sources** (default for HSS domain):
- **Baidu Scholar / 百度学术** (primary Chinese academic search)
- **NCPSSD / 国家哲学社会科学文献中心** (free full-text Chinese social science)
- **Google Scholar** (broad academic coverage, Chinese mode)
- **CNKI metadata** (China National Knowledge Infrastructure, metadata from search results)

Deduplicate results by arXiv ID, DOI, or title similarity. Apply time window filtering.

### Phase 3: Select
Use the **paper-selector** sub-skill to score and rank all candidate papers on:
- Novelty, impact potential, methodological rigor
- Relevance to the user's topic
- Citation momentum and venue quality
- Journal/venue tier (CSSCI ranking for HSS papers)

Select the top N papers (default 5) with selection rationale. Scoring weights differ between STEM and HSS domains.

### Phase 4: Analyze
Use the **paper-analyzer** sub-skill to produce a deep analysis of each selected paper:
- Must-read rationale
- Core insight and technical approach
- Hardest problem and how it was solved
- Key results and limitations
- Connections to other work

### Phase 5: Synthesize
Use the **field-synthesizer** sub-skill to produce a macro-level field overview:
- Active research directions and key players
- Methodological trends
- Research gaps and opportunities
- Predictions for the next 6-12 months

## Commands

| Command | Description |
|---------|-------------|
| `paper-track [topic]` | Full workflow: search, select, analyze, synthesize |
| `search-papers [topic]` | Search only: return a list of recent papers |
| `analyze-paper [URL/title]` | Analyze a single paper in depth |
| `field-overview [topic]` | Generate field landscape overview only |

### Common Arguments

| Argument | Default | Description |
|----------|---------|-------------|
| `--days N` | 7 | Time window for paper search (in days) |
| `--top N` | 5 | Number of top papers to select and analyze |
| `--lang en\|zh` | en | Output language (English or Chinese) |
| `--source arxiv\|scholar\|baidu\|ncpssd\|all` | all | Restrict search to specific source |
| `--domain stem\|hss\|auto` | auto | Research domain: STEM, HSS, or auto-detect |

## Output Structure

All output is saved to `RESEARCH/paper-track/[topic-slug]/`:

```
RESEARCH/paper-track/[topic-slug]/
  README.md              # Overview and table of contents
  executive_summary.md   # Quick 1-page digest
  papers/                # Individual paper analyses
    01-paper-title.md
    02-paper-title.md
    ...
  field_overview.md      # Landscape, trends, gaps, opportunities
  reading_list.md        # Prioritized reading order with time estimates
```

## Language Support

- **Default**: English (`--lang en`)
- **Chinese**: Use `--lang zh` to output all sections in Chinese
- The `--lang` parameter propagates to all sub-skills
- Paper titles and author names always remain in their original language
- When outputting in Chinese, technical terms include both languages:
  - Example: "注意力机制 (Attention Mechanism)"
  - Example: "大语言模型 (Large Language Model)"

## Sub-Skills

| Sub-Skill | Purpose |
|-----------|---------|
| [paper-searcher](skills/paper-searcher/SKILL.md) | Multi-source academic paper search |
| [paper-selector](skills/paper-selector/SKILL.md) | Intelligent paper ranking and selection |
| [paper-analyzer](skills/paper-analyzer/SKILL.md) | Deep single-paper analysis |
| [field-synthesizer](skills/field-synthesizer/SKILL.md) | Research landscape synthesis |

## Usage Examples

### Track latest papers on a topic
```
/paper-track "vision-language models" --days 14 --top 10
```

### Quick search without analysis
```
/search-papers "diffusion models for video generation" --days 7
```

### Deep-dive into a single paper
```
/analyze-paper "https://arxiv.org/abs/2401.12345"
```

### Field landscape overview
```
/field-overview "efficient inference for LLMs" --days 30 --lang zh
```

### Track latest HSS papers (Chinese social sciences)
```
/paper-track "乡村振兴与社会治理" --days 30 --domain hss --lang zh
```

### Track HSS papers with auto-detection
```
/paper-track "digital economy and rural development in China" --days 14
```
