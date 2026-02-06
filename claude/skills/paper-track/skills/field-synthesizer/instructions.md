# Field Synthesizer - Instructions

## Synthesis Protocol

Analyze a collection of recent papers to produce a macro-level overview of a research field. The synthesis should help PhD researchers orient themselves, identify opportunities, and make strategic decisions.

### Information Sources

Beyond the collected papers, also gather context from:

**For STEM fields:**
- Recent survey papers on the topic
- Conference workshop/tutorial pages (NeurIPS, ICML, ICLR, ACL, CVPR)
- Blog posts from major labs (Google DeepMind, OpenAI, Meta AI, Anthropic, Microsoft Research)
- Research job postings (indicate what labs are investing in)
- Benchmark leaderboards (indicate active competition areas)

**For HSS fields:**
- Recent review articles (综述) in CSSCI journals
- Conference proceedings and keynote themes (e.g., Chinese Sociological Association annual meeting, Chinese Historical Association conferences)
- Academic WeChat public accounts (学术公众号) from major research centers
- National research funding priorities (国家社科基金项目指南)
- University research center focuses and newly established institutes
- Policy documents and white papers (政策文件) that indicate applied research demand
- Book series and monograph collections indicating emerging themes

**HSS-specific information sources (when domain = hss):**
- CSSCI journal databases and rankings
- National Social Science Fund (国家社科基金) project listings and annual topic guides
- Academic WeChat public accounts (学术公众号) for field trends
- Chinese academic conferences and annual meetings
- University research center websites (教育部人文社科重点研究基地)
- Book series and edited volumes in the field
- Academic review journals: 《新华文摘》《中国社会科学文摘》《人大复印资料》

### Section 1: Field Overview

**Purpose:** Provide context for a researcher adjacent to but not deeply in this field.

**Guidelines:**
- Write 2-3 paragraphs covering:
  - What is this research area fundamentally about?
  - Why does it matter? What problems does it solve?
  - What is the current state of maturity? (nascent / rapidly growing / maturing / saturated)
- Use accessible language; avoid assuming deep domain knowledge
- Mention the key enabling breakthroughs that made current work possible

### Section 2: Active Research Directions

**Purpose:** Map the landscape of current work into coherent themes.

**Guidelines:**
- Identify 3-7 major research directions
- For each direction provide:
  - **Name**: A descriptive label (e.g., "Efficient Fine-Tuning Methods")
  - **Description**: 1-2 sentences on what this direction is about
  - **Key Papers**: 2-4 representative papers with links
  - **Key Groups**: Which labs/researchers are driving this direction
  - **Status**: Early-stage / Actively growing / Maturing / Consolidating
  - **Open Challenges**: 1-2 unsolved problems within this direction

**Clustering strategy:**
- Start by listing all papers and their primary contributions
- Group papers that address similar problems or use similar techniques
- Merge clusters that are too small (< 2 papers)
- Split clusters that are too broad (> 10 papers)
- Name each cluster with a descriptive, non-overlapping label

### Section 3: Methodological Trends

**Purpose:** Identify which techniques are rising and falling in popularity.

**Guidelines:**
- **Rising techniques**: Methods appearing frequently in recent papers
  - Why they are gaining traction
  - What advantage they offer over older approaches
  - Example papers that exemplify this trend

- **Declining techniques**: Methods that were popular but are being replaced
  - Why they are falling out of favor
  - What is replacing them

- **Paradigm shifts**: Any fundamental changes in how the field approaches problems
  - What changed and why
  - Is this shift complete or still in progress?

- **Common evaluation practices**: Standard benchmarks, datasets, and metrics
  - Which benchmarks are considered gold standard?
  - Are any benchmarks becoming saturated or obsolete?
  - Any new benchmarks gaining adoption?

**HSS-specific methodological trends (when domain = hss):**

- **Rising methods**: Digital humanities approaches, computational text analysis, mixed methods, interdisciplinary frameworks, big data in social sciences
- **Declining methods**: Note any traditional approaches losing favor
- **Paradigm shifts**: Note shifts in dominant theoretical frameworks
- **Evaluation practices**: Publication in CSSCI journals, reprinting in 人大复印资料/新华文摘, National Social Science Fund project completion ratings

### Section 4: Key Players & Groups

**Purpose:** Identify who is doing the most impactful work.

**Guidelines (STEM):**

**Academic Labs:**
- List 5-10 most active academic groups
- Note their university, PI name, and primary focus area
- Mention recent notable papers from each

**Industry Labs:**
- List 3-7 most active industry labs
- Note their parent company and research focus
- Mention any unique advantages (data, compute, deployment scale)

**Individual Researchers:**
- Identify 5-10 prolific or rising researchers
- Note their affiliation and contribution area
- Highlight any emerging researchers (early career with high impact)

**Collaborations:**
- Notable academic-industry partnerships
- Cross-institutional research programs
- Shared benchmarks or datasets

**HSS Adaptations (when domain = hss):**

Replace the above structure with:

**Leading Universities & Institutes (重点高校与研究机构):**
- List 5-10 most active universities/institutes in this field
- Note their key departments, research centers, and 教育部人文社科重点研究基地
- Mention their signature research directions and recent major publications

**Key Research Groups & Centers (课题组与研究中心):**
- Identify major research teams and their leaders (PI/首席专家)
- Note any National Social Science Fund major projects (国家社科基金重大项目) they lead
- Highlight research bases and think tanks (高端智库) active in this area

**Individual Scholars (代表学者):**
- Identify 5-10 most influential scholars
- Note: affiliation, research focus, key publications
- Highlight: Changjiang Scholars (长江学者), National Social Science Fund major project PIs
- Identify rising scholars (recently published in top C刊 with high impact)

**Key Journals & Platforms (核心期刊与学术平台):**
- Which CSSCI journals are most important for this field?
- Key book series or edited volumes
- Important annual conferences or forums
- Active academic WeChat public accounts

**Guidelines (HSS):**

**Major Research Centers / 重要研究中心:**
- List 5-10 most active research centers or institutes
- Note their host institution and director (主任)
- Mention their primary focus area and recent major publications or projects

**Key Universities / 重点高校:**
- Identify 3-7 universities with strong concentrations in this field
- Note which departments or schools are most active
- Mention any distinctive theoretical orientations or methodological strengths

**Leading Scholars / 核心学者:**
- Identify 5-10 most prolific or influential scholars
- Note their affiliation, academic rank (长江学者, 杰青, etc.), and main research areas
- Highlight emerging scholars (younger generation with increasing impact)

**Academic Schools & Debates / 学派与学术争鸣:**
- Identify major theoretical schools or scholarly traditions in the field
- Note key debates or divergent perspectives among scholars
- Mention representative scholars of each school

**Funding & Policy Support / 资助与政策支持:**
- Major National Social Science Fund (国家社科基金) projects in this area
- Ministry of Education key research bases (教育部重点研究基地)
- Policy think tanks (政策智库) engaged with this field

### Section 5: Research Gaps

**Purpose:** Identify important problems that are NOT being adequately addressed.

**Guidelines:**
- Be specific and actionable; vague gaps are useless
- For each gap, explain:
  - What the gap is
  - Why it matters (what would solving it enable?)
  - Why it might be under-explored (too hard? not trendy? overlooked?)
  - Any partial attempts that fell short

**Categories of gaps to consider (STEM):**
- **Missing evaluations**: Important use cases or domains not covered
- **Scalability gaps**: Methods that work small but not large (or vice versa)
- **Theory gaps**: Empirical results without theoretical understanding
- **Fairness/safety gaps**: Social impact considerations being ignored
- **Integration gaps**: Components that work individually but not together
- **Real-world gaps**: Lab results that do not translate to deployment

**Categories of gaps to consider (HSS):**
- **Empirical gaps / 实证不足**: Theoretical frameworks lacking empirical validation
- **Regional/temporal gaps / 区域与时段覆盖**: Understudied geographic areas, historical periods, or social groups
- **Methodological gaps / 方法论缺失**: Over-reliance on qualitative or quantitative methods without mixed-methods approaches
- **Interdisciplinary gaps / 跨学科对话不足**: Fields that could benefit from insights from adjacent disciplines
- **Theoretical renewal gaps / 理论创新不足**: Over-application of Western theories without localized theoretical development (本土化理论)
- **Policy translation gaps / 政策转化不足**: Academic findings not effectively informing public policy
- **Data accessibility gaps / 数据可及性**: Important archives, datasets, or field sites remaining inaccessible
- **Contemporary relevance gaps / 当代关切**: Historical or theoretical work disconnected from pressing social issues

### Section 6: Opportunities & White Spaces

**Purpose:** Identify the most promising directions for new research.

**Guidelines:**
For each opportunity:

```markdown
#### Opportunity: [Descriptive Name]

**Description:** [What the opportunity is, in 2-3 sentences]

**Potential Impact:** High / Medium / Low
[Brief justification]

**Competition Level:** High / Medium / Low
[How many groups are working on this? Is there a first-mover advantage?]

**Feasibility for a PhD Student:** High / Medium / Low
[Does this require massive compute? Proprietary data? Large team?]

**Why Now:** [What makes this timely? New datasets? New techniques? New demand?]

**Possible Approaches:** [1-2 suggested starting points]
```

**HSS-specific opportunity signals:**

When domain = hss, additionally consider:

```markdown
**National Research Priorities:** [Reference to 国家社科基金 annual guide topics relevant to this opportunity]

**Policy Relevance:** High / Medium / Low
[Is this topic aligned with current government policy priorities? Relevant policy documents?]
```

**Prioritize HSS opportunities that are:**
- Aligned with 国家社科基金 annual project guide topics (indicates funding availability)
- At the intersection of Chinese and international scholarly traditions
- Responsive to current social/policy challenges
- Feasible with publicly available data or fieldwork access

**Prioritize opportunities that are:**
- High impact + Low competition + High feasibility = Best for PhD students
- Enabled by very recent work (last 3-6 months)
- At the intersection of two active directions (cross-pollination)

### Section 7: Predictions

**Purpose:** Forecast where the field is heading in 6-12 months.

**Guidelines:**
- Be specific and time-bounded
- Base predictions on observable trends, not wishful thinking
- Include both optimistic and cautious scenarios
- Structure predictions as:

```markdown
1. **[Prediction]** (Confidence: High/Medium/Low)
   [1-2 sentences of reasoning]
   Timeline: [X months]
```

**Types of predictions:**
- Which research directions will accelerate?
- Which problems are close to being solved?
- What new problems will emerge?
- Which benchmarks will be superseded?
- Which conferences will feature this work prominently?
- Will there be a paradigm shift or consolidation?

## Language Handling

If `--lang zh` is specified:
- Write all synthesis content in Chinese
- Keep proper nouns (lab names, researcher names, paper titles) in English
- Bilingual technical terms: "强化学习 (Reinforcement Learning)"
- Maintain the same structure and depth

## Quality Checklist

Before delivering:

**For all fields:**
- [ ] At least 3 distinct research directions identified
- [ ] Each direction references at least 2 specific papers
- [ ] Gaps are specific and actionable (not "more work is needed")
- [ ] Opportunities are rated on all 3 dimensions (impact, competition, feasibility)
- [ ] Predictions are time-bounded and based on evidence
- [ ] Rising AND declining methodological trends are identified
- [ ] The overview would genuinely help a PhD student orient themselves in 30 minutes

**For STEM fields:**
- [ ] Key players section covers both academia AND industry
- [ ] Benchmark saturation discussed in methodological trends
- [ ] Cross-references to code repositories where relevant

**For HSS fields:**
- [ ] Key players section covers research centers, universities, and leading scholars
- [ ] Academic schools and theoretical debates identified
- [ ] Major funding sources and policy connections noted
- [ ] Localization/contextualization (本土化) vs. international dialogue discussed
- [ ] CSSCI journal coverage and publication venues mentioned
- [ ] For HSS: Key players include Chinese universities, institutes, and individual scholars
- [ ] For HSS: Journal quality assessed using CSSCI tier system
- [ ] For HSS: Opportunities reference 国家社科基金 or policy priorities where relevant
