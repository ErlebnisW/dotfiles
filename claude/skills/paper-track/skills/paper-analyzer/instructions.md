# Paper Analyzer - Instructions

## Analysis Protocol

For each paper, produce a structured analysis following the 8-section framework below. The analysis should be written for a PhD-level audience: technically precise, insight-driven, and actionable.

### Information Gathering

Before analyzing, gather as much information as possible:

1. **Primary source**: Fetch the paper's abstract page (arXiv, OpenReview, conference proceedings)
2. **Extended content**: If accessible, read the introduction and conclusion sections
3. **Supplementary context**: Search for blog posts, Twitter threads, or video presentations about the paper
4. **Code availability**: Check if code is released on GitHub or Papers With Code
5. **Author context**: Note the lab and researchers (helps assess credibility and research lineage)

### Information Gathering (HSS Mode)

For HSS papers (especially Chinese-language), adapt the information gathering strategy:

1. **Primary source**: Attempt to access the paper via NCPSSD (free full text) or Baidu Scholar detail page
2. **Extended content**: If full text is accessible via NCPSSD, read the introduction and conclusion. Otherwise, rely on the extended abstract from Baidu Scholar
3. **Supplementary context**: Search for:
   - Academic WeChat public account (学术公众号) interpretations: `[paper title] 解读 OR 评论`
   - Zhihu (知乎) discussions: `site:zhihu.com [paper title or topic]`
   - Book reviews if the paper is from a monograph: `[author] [title] 书评`
4. **Author context**: Search for the author's institutional page, CNKI author profile, or Baidu Scholar author page
5. **Full-text access links**: Generate links for user convenience:
   - NCPSSD: `https://www.ncpssd.cn/` + search for title
   - CNKI: `https://www.cnki.net/` + search for title
   - Baidu Scholar: `https://xueshu.baidu.com/` + search for title

**Depth strategy for HSS papers:**
1. **Best case**: WebFetch NCPSSD full-text page → full analysis
2. **Good case**: WebFetch Baidu Scholar detail page → extended abstract analysis
3. **Backup**: WebSearch for academic public account interpretations or book reviews
4. **Fallback**: Analysis based on title + abstract + journal info, clearly marked as "基于摘要的分析 (Abstract-based analysis)"
5. **Always**: Provide NCPSSD / CNKI / Baidu Scholar links for the user to access full text

### Section 1: Must-Read Rationale

**Purpose:** Convince the researcher that their time is well-spent reading this paper.

**Guidelines:**
- Be specific about what the reader will gain
- Frame it in terms of research utility: "If you work on X, this paper..."
- Mention any unique insights not available elsewhere
- Keep to 2-3 compelling sentences

**Template:**
> This paper is essential reading for researchers working on [specific area] because [specific reason]. It introduces [specific contribution] that [specific impact]. Reading it will [specific benefit for the researcher].

### Section 2: Core Insight

**Purpose:** Distill the paper's central idea into its essence.

**Guidelines:**
- What is the ONE key idea that makes this paper work?
- What did the authors understand that previous work missed?
- Express this in 2-3 sentences maximum
- Avoid jargon where possible; use precise technical language where necessary

**Ask yourself:** If someone could only remember one thing from this paper, what should it be?

### Section 3: Technical Approach

**Purpose:** Explain what the paper does and how.

**Structure:**

**Problem Formulation:**
- What exact problem are the authors solving?
- What are the inputs, outputs, and constraints?
- What makes this problem hard?

**Proposed Method/Architecture:**
- High-level description of the solution (2-4 sentences)
- Key architectural choices or algorithmic steps
- What makes this approach different from the obvious solution?

**Key Innovations vs Prior Work:**
- What is genuinely new? (Not just "we combine X and Y")
- What is the delta over the closest existing method?
- What prior limitations does this address?

### Section 4: Hardest Problem & Solution

**Purpose:** Identify the most technically challenging aspect and how it was overcome.

**Guidelines:**
- This is often the MOST valuable section for researchers
- Look for: scaling challenges, optimization difficulties, data limitations, theoretical gaps
- Explain why naive approaches fail
- Describe the elegant (or hacky) solution the authors found
- Note whether this solution generalizes beyond this specific paper

**Ask yourself:** What would have stopped me if I tried to build this? How did they get past it?

### Section 5: Key Results

**Purpose:** Summarize the quantitative evidence for the paper's claims.

**Guidelines:**
- Report specific numbers, not vague claims
- Always include comparison to the previous best result
- Highlight the most important ablation findings
- Note any surprising or counter-intuitive results
- Use a bullet list for clarity

**Format:**
```markdown
- **Main result**: [Method] achieves [X.X%] on [benchmark], compared to previous SOTA of [Y.Y%] (+Z.Z%)
- **Efficiency**: [X]x faster/cheaper than [baseline] while maintaining [Y%] of performance
- **Ablation highlight**: Removing [component] drops performance by [X%], confirming its importance
- **Surprising finding**: [description of counter-intuitive result]
```

### Section 6: Limitations & Open Questions

**Purpose:** Identify what the paper does NOT solve.

**Guidelines:**
- Include both explicitly acknowledged limitations AND your assessment
- Be honest but fair; every paper has limitations
- Frame limitations as research opportunities when possible
- Identify potential failure modes or edge cases

**Categories to consider:**
- Scalability: Does it work at larger scale?
- Generalization: Does it work on different domains/tasks?
- Compute: What are the resource requirements?
- Data: What data assumptions are made?
- Theoretical: Are there missing proofs or guarantees?
- Reproducibility: Can others replicate this?

### Section 7: Connections

**Purpose:** Place the paper in the broader research context.

**Guidelines:**
- **Builds on**: What prior work is this a direct successor to?
- **Related concurrent work**: What similar papers appeared around the same time?
- **Enables**: What future work does this make possible?
- **Contrasts with**: What competing approaches take a different view?

### Section 8: One-Line Summary

**Purpose:** A single tweet-length sentence capturing the paper's essence.

**Guidelines:**
- Maximum 280 characters
- Should be understandable without reading the full analysis
- Include the key method and result
- Avoid generic descriptions

**Good example:** "FlashAttention-3 exploits GPU warp specialization to make attention 2x faster on H100s, enabling 1M context windows without approximation."

**Bad example:** "A new paper that improves attention mechanism performance."

## HSS Analysis Template

When `domain = hss`, use the following adapted 8-section framework instead of the STEM template. The analysis should be written for a scholarly audience familiar with humanities/social sciences conventions.

### Section 1: Must-Read Rationale (必读理由)

Same as STEM. Convince the researcher that their time is well-spent reading this paper.

**HSS-adapted template:**
> This paper is essential reading for scholars working on [specific field/debate] because [specific reason]. It advances [specific theoretical contribution] through [specific method/evidence]. Reading it will [specific benefit].

### Section 2: Core Argument (核心论点)

**Purpose:** Distill the paper's central thesis or hypothesis.

**Guidelines:**
- What is the central claim or proposition?
- What theoretical position does the paper stake out?
- How does this differ from the prevailing view in the field?
- Express in 2-3 sentences

**Ask yourself:** What is the author arguing, and against whom/what?

### Section 3: Research Method & Materials (研究方法与材料)

**Purpose:** Explain the paper's methodological approach and evidentiary base.

**Structure:**

**Theoretical Framework:**
- What theory or school of thought does the paper draw on?
- Is it explicitly stated or implicitly assumed?

**Sources and Data:**
- What primary sources are used? (archival documents, fieldwork data, survey data, statistical data, legal texts, literary texts, etc.)
- What is the temporal and geographic scope?
- How were sources selected and accessed?

**Analytical Method:**
- Qualitative analysis? Quantitative analysis? Mixed methods?
- Comparative study? Case study? Discourse analysis? Historical analysis?
- What makes this methodological choice appropriate for the research question?

### Section 4: Key Argumentation (关键论证)

**Purpose:** Identify the most compelling chain of argument or use of evidence.

**Guidelines:**
- This is the HSS equivalent of STEM's "Hardest Problem & Solution"
- What is the most brilliant or persuasive part of the paper's reasoning?
- Where does the author deploy evidence most effectively?
- What logical moves make the argument convincing?
- Does the author successfully address potential counter-arguments?

**Ask yourself:** If I could only show someone one section of this paper to convince them of its quality, which would it be?

### Section 5: Core Findings & Conclusions (核心发现与结论)

**Purpose:** Summarize the main discoveries and conclusions.

**Guidelines:**
- What are the primary findings? (for empirical papers)
- What conclusions does the author reach? (for theoretical papers)
- Are the conclusions well-supported by the evidence presented?
- Any surprising or counter-intuitive findings?
- What are the policy implications, if any?

### Section 6: Limitations & Room for Discussion (局限性与商榷空间)

**Purpose:** Identify what the paper does NOT resolve and where scholarly debate remains open.

**Guidelines:**
- What does the paper explicitly acknowledge as limitations?
- What questions remain open for further scholarly discussion (商榷)?
- Are there alternative interpretations the author did not consider?
- What additional evidence or cases would strengthen or challenge the argument?
- Are there methodological limitations (sample bias, source gaps, theoretical blind spots)?

**HSS-specific categories:**
- **Source limitations**: Gaps in archival or fieldwork coverage
- **Theoretical scope**: Is the framework too narrow or too broad?
- **Generalizability**: Do the findings apply beyond the specific case studied?
- **Temporal limitations**: Has the situation changed since the research was conducted?
- **Interdisciplinary gaps**: Could insights from adjacent fields enrich the analysis?

### Section 7: Scholarly Context (学术脉络)

**Purpose:** Place the paper within its intellectual and scholarly tradition.

**Guidelines:**
- **Academic lineage**: Which scholarly tradition or school does this paper belong to?
- **Key interlocutors**: Which scholars and works is the author in dialogue with?
- **Intellectual debate**: What larger scholarly debate does this paper contribute to?
- **Innovation**: How does this paper advance or challenge the existing scholarly conversation?
- **Influence**: What subsequent work has cited or engaged with this paper?

**This section replaces STEM's "Connections" and is adapted for HSS's emphasis on 学术史 (academic history) and 学术对话 (scholarly dialogue).**

### Section 8: One-Line Summary (一句话总结)

Same as STEM. A single tweet-length sentence capturing the paper's essence.

## Language Handling

If `--lang zh` is specified:
- Write all analysis sections in Chinese
- Keep paper titles, author names, and method names in English
- For technical terms, provide bilingual format: "自注意力机制 (Self-Attention)"
- Maintain the same section structure and quality standards

**HSS-specific language notes:**
- For Chinese HSS papers analyzed with `--lang zh`, keep the section headers bilingual: "核心论点 (Core Argument)"
- For Chinese HSS papers analyzed with `--lang en`, translate the analysis to English but keep paper titles, author names, journal names, and Chinese technical terms (学术概念) in their original language with translations
- Include both Chinese and English for discipline-specific concepts: "乡村振兴 (Rural Revitalization)", "社会治理 (Social Governance)"

## Quality Checklist

Before delivering the analysis, verify:

**For STEM papers:**
- [ ] Must-Read Rationale is compelling and specific
- [ ] Core Insight captures the real "aha" moment (not just a description)
- [ ] Technical Approach includes genuine innovations, not just method description
- [ ] Hardest Problem identifies a non-obvious technical challenge
- [ ] Key Results include specific numbers and comparisons
- [ ] Limitations are honest and go beyond what authors acknowledge
- [ ] Connections reference specific papers, not vague fields
- [ ] One-Line Summary is tweet-length and informative

**For HSS papers:**
- [ ] Must-Read Rationale is compelling and specific for the scholarly field
- [ ] Core Argument identifies the central thesis and its theoretical position
- [ ] Research Method & Materials clearly describes sources and analytical approach
- [ ] Key Argumentation identifies the most persuasive chain of reasoning
- [ ] Core Findings are well-supported by evidence
- [ ] Limitations & Room for Discussion goes beyond what authors acknowledge
- [ ] Scholarly Context places paper in academic tradition and debates
- [ ] One-Line Summary is tweet-length and informative
- [ ] Full-text access links provided (NCPSSD, CNKI, Baidu Scholar)
- [ ] Analysis depth matches available source material (clearly marked if abstract-based)
