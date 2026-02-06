---
description: Search for recent papers on a topic without full analysis
argument-hint: "[topic] [--days N] [--source arxiv|scholar|baidu|ncpssd|all] [--domain stem|hss|auto]"
allowed-tools: Task, WebSearch, WebFetch, Read, Write
---

# Search Papers

Search for recent papers on a given topic and return a simple list without deep analysis.

## Topic

$ARGUMENTS

## Argument Parsing

- **topic** (required): The research topic or query string
- **--days N** (default: 7): Time window in days
- **--source arxiv|scholar|baidu|ncpssd|all** (default: all): Restrict to a specific source
- **--domain stem|hss|auto** (default: auto): Research domain for automatic source selection

## Workflow

### Step 0: Domain Detection

If `--domain auto` (default), detect the domain from topic keywords:

**HSS signals (Chinese):** 经济, 管理, 社会, 法律, 政治, 历史, 哲学, 文学, 语言, 教育, 传播, 艺术, 民族, 宗教, 人口, 考古, 新闻, 图书馆, 马克思, 伦理, 美学, 心理, 公共政策, 国际关系, 乡村振兴, 社会治理, 文化, 制度

**HSS signals (English):** sociology, economics (non-quantitative context), political science, history, philosophy, literature, linguistics, anthropology, law, education, communication studies, area studies

**STEM signals:** arXiv, model, algorithm, dataset, benchmark, neural, transformer, GPU, training, inference, code, API, machine learning, deep learning, computer vision, NLP

**Resolution:**
- If only HSS signals → domain = hss
- If only STEM signals → domain = stem
- If both or ambiguous → search both source sets
- `--domain` parameter always overrides auto-detection

### Step 1: Search

Deploy parallel searches based on the `--source` flag and detected/specified domain:

**STEM sources (if domain = stem or auto or source = arxiv/scholar/all):**

**If source = arxiv or all:**
```
WebSearch: site:arxiv.org [topic] [current year]
```

**If source = scholar or all:**
```
WebSearch: [topic] research paper [current year]
WebSearch: site:semanticscholar.org [topic]
```

**If source = all (additionally):**
```
WebSearch: site:paperswithcode.com [topic]
WebSearch: site:huggingface.co/papers [topic]
```

**HSS sources (if domain = hss or auto or source = baidu/ncpssd/all):**

**If source = baidu or all:**
```
WebSearch: 百度学术 [topic] CSSCI [current year]
WebSearch: site:xueshu.baidu.com [topic]
```

**If source = ncpssd or all:**
```
WebSearch: site:ncpssd.cn [topic]
WebSearch: 国家哲学社会科学文献中心 [topic] [current year]
```

**If source = scholar or all (HSS mode):**
```
WebSearch: [中文topic] site:cnki.net OR site:wanfangdata.com.cn [current year]
WebSearch: [中文topic] CSSCI 期刊论文 [current year]
```

**If source = all (HSS, additionally):**
```
WebSearch: cnki [topic] CSSCI [current year]
WebSearch: 知网 [topic] 核心期刊
```

### Step 2: Collect Metadata

For each paper found, use WebFetch on the paper URL to collect:

**For STEM papers:**
- **Title**
- **Authors** (first author + et al. if many)
- **Date** (publication or submission date)
- **Abstract** (first 2-3 sentences)
- **Source URL**
- **Citation count** (if available from Semantic Scholar)

**For HSS papers:**
- **Title** (Chinese or English)
- **Authors** (first author + et al. if many)
- **Date** (publication date)
- **Abstract** (first 2-3 sentences, Chinese or English)
- **Journal name**
- **CSSCI status** (if applicable)
- **Source URL** (NCPSSD, Baidu Scholar, CNKI, etc.)
- **Citation count** (if available)
- **Full-text links** (NCPSSD free link if available)

### Step 3: Filter and Deduplicate

- Remove papers outside the time window
- **STEM:** Deduplicate by arXiv ID or title similarity (>90% match)
- **HSS:** Deduplicate by exact title match or title similarity (>85% match)
- Sort by date (newest first)

### Step 4: Output

Present results as a numbered markdown list:

**For STEM papers:**

```markdown
## Recent Papers: [topic] (last N days)

Found X papers. Searched: [sources used].

### 1. [Paper Title]
**Authors:** First Author et al.
**Date:** YYYY-MM-DD
**Abstract:** First 2-3 sentences of abstract...
**Link:** https://arxiv.org/abs/XXXX.XXXXX
**Citations:** N (if available)

---

### 2. [Paper Title]
...
```

**For HSS papers:**

```markdown
## 近期文献: [topic] (最近N天)

找到 X 篇文献。检索来源：[sources used].

### 1. [Paper Title]
**作者:** 第一作者 等
**日期:** YYYY-MM-DD
**期刊:** [期刊名称]
**CSSCI:** 是/否
**摘要:** 摘要前2-3句...
**链接:**
- [NCPSSD全文](https://ncpssd.cn/...) (免费)
- [百度学术](https://xueshu.baidu.com/...)
- [知网](https://cnki.net/...)
**引用:** N (如有)

---

### 2. [Paper Title]
...
```

If no papers are found, report that clearly and suggest:
- Expanding the time window
- Broadening the search terms
- Trying different sources

Output the results directly to the user (not saved to file unless they request it).
