---
description: Deep-analyze a single paper given its URL or title
argument-hint: "[paper URL or title] [--domain stem|hss|auto] [--lang en|zh]"
allowed-tools: Task, WebSearch, WebFetch, Read, Write
---

# Analyze Paper

Perform a deep analysis of a single academic paper.

## Paper

$ARGUMENTS

## Argument Parsing

Parse the following from $ARGUMENTS:
- **paper identifier** (required): URL or title of the paper
- **--domain stem|hss|auto** (default: auto): Research domain for analysis template selection
- **--lang en|zh** (default: en): Output language

## Workflow

### Step 0: Domain Detection

If `--domain auto` (default), infer domain from:
1. URL domain (arxiv.org, ncpssd.cn, cnki.net, xueshu.baidu.com)
2. Paper title language (Chinese characters → likely HSS)
3. If ambiguous, default to STEM

### Step 1: Locate the Paper

**For STEM papers:**

**If a URL is provided** (contains arxiv.org, semanticscholar.org, openreview.net, etc.):
- Use WebFetch to retrieve the paper's abstract page
- Extract title, authors, abstract, date, venue

**If a title is provided:**
- Use WebSearch to find the paper: `"[exact title]" arxiv OR semanticscholar`
- Use WebFetch on the best matching result to get metadata

**If a Chinese paper title is provided (or --domain hss):**
- Use WebSearch to find the paper: `百度学术 "[exact title]"` or `site:ncpssd.cn "[exact title]"`
- Use WebFetch on the best matching result to get metadata
- Also try: `cnki "[exact title]"` for CNKI metadata

**For HSS papers:**

**If a URL is provided** (contains ncpssd.cn, cnki.net, xueshu.baidu.com, etc.):
- Use WebFetch to retrieve the paper's detail page
- Extract title, authors, journal, abstract, date
- Extract full-text links (NCPSSD free link if available)

**If a title (Chinese or English) is provided:**
- Use WebSearch: `"[exact title]" site:ncpssd.cn OR site:xueshu.baidu.com OR site:cnki.net`
- Use WebFetch on the best matching result

### Step 2: Gather Context

**For STEM papers:**
- Fetch the full abstract and introduction if accessible
- Search for related blog posts or summaries: `[paper title] summary OR explained OR review`
- Check for code implementations: `site:github.com [paper title]` or `site:paperswithcode.com [paper title]`
- Look for citation context on Semantic Scholar if available

**For HSS papers:**
- Attempt to access full text via NCPSSD (free after registration)
- If full text unavailable, rely on extended abstract from Baidu Scholar or CNKI
- Search for academic commentary: `[paper title] 解读 OR 评论 OR 述评`
- Search for discussions on Zhihu: `site:zhihu.com [paper title or topic]`
- Search for author's institutional page or CNKI author profile
- Look for reprints in digest journals (人大复印资料, 新华文摘, 中国社会科学文摘)
- Generate full-text access links: NCPSSD | CNKI | Baidu Scholar

### Step 3: Deep Analysis

Apply the **paper-analyzer** sub-skill framework to produce:

**If domain = stem**, use the STEM analysis template:

#### Must-Read Rationale
Why should a PhD researcher read this paper? What will they gain that they cannot get elsewhere? Be specific and compelling.

#### Core Insight
The central idea or contribution in 2-3 sentences. What is the key "aha" moment? What does this paper understand that previous work missed?

#### Technical Approach
- **Problem formulation**: What exact problem are they solving? What are the inputs and outputs?
- **Proposed method/architecture**: How does the solution work at a high level?
- **Key innovations vs prior work**: What is genuinely new here? What is the delta over existing methods?

#### Hardest Problem & Solution
What was the most challenging technical problem the authors faced? How did they solve it? This section is often the most valuable for researchers because it reveals non-obvious engineering and theoretical insights.

#### Key Results
- Main quantitative results with specific numbers
- How results compare to state-of-the-art
- Most important ablation findings
- Any surprising results or counter-intuitive findings

#### Limitations & Open Questions
- What the paper explicitly acknowledges as limitations
- What the paper does NOT solve but should
- Open questions for future work
- Potential failure modes or edge cases

#### Connections
- What prior work this builds upon (direct lineage)
- What concurrent/subsequent work relates to this
- What research directions this enables

#### One-Line Summary
A single tweet-length sentence capturing the essence of the paper.

**If domain = hss**, use the HSS analysis template:

#### Must-Read Rationale (必读理由)
Same as STEM — why should a scholar read this paper? What will they gain that they cannot get elsewhere?

#### Core Argument (核心论点)
The central thesis or hypothesis. What is the author arguing, and against whom/what? What theoretical position does the paper stake out?

#### Research Method & Materials (研究方法与材料)
- **Theoretical framework**: What theory or school of thought is applied?
- **Sources and data**: What primary sources are used (archival, fieldwork, survey, statistical, literary texts)?
- **Analytical method**: Qualitative, quantitative, comparative, case study, discourse analysis, historical analysis?

#### Key Argumentation (关键论证)
The most compelling chain of argument or use of evidence. Where does the author deploy evidence most effectively? What makes the argument convincing?

#### Core Findings & Conclusions (核心发现与结论)
Main discoveries and conclusions. Are they well-supported? Any surprising findings? Policy implications?

#### Limitations & Room for Discussion (局限性与商榷空间)
What remains open for scholarly discussion? Alternative interpretations not considered? Methodological limitations?

#### Scholarly Context (学术脉络)
Academic lineage and tradition. Key interlocutors and works in dialogue. Position within the larger scholarly debate.

#### One-Line Summary (一句话总结)
Same as STEM — tweet-length summary.

**For HSS papers, also provide:**
- Full-text access links: NCPSSD (free), CNKI, Baidu Scholar
- Note if analysis is based on abstract only vs. full text

### Step 4: Output

Present the analysis directly to the user in a well-formatted markdown structure.

If `--lang zh` is specified, write all analysis sections in Chinese.

If the user wants to save it, write to `RESEARCH/paper-track/analyses/[paper-title-slug].md`.

## Error Handling

- If the paper cannot be found: report clearly, suggest alternative search terms
- If the paper is behind a paywall: analyze based on available abstract, blog posts, and summaries; note that analysis is based on limited access
- If the paper is a Chinese-language paper with no free full text: analyze based on abstract, academic public account interpretations, and available metadata; note that analysis is "基于摘要的分析 (abstract-based analysis)" and provide full-text access links
- If the paper is very recent with no external discussion: note this and focus on the abstract and any available content
