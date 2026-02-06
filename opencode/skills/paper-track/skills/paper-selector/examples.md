# Paper Selector - Examples

## Example: Selecting Top 3 Papers on "Efficient LLM Inference"

### Candidate Papers (6 papers from search)

1. "FlashDecoding++: Faster Large Language Model Inference on GPUs" - Li et al., 2026
2. "Speculative Decoding with Big Little Decoder Revisited" - Kim et al., 2026
3. "MoE-Infinity: Offloading-Aware Mixture of Experts Inference" - Xue et al., 2026
4. "A Survey of Efficient LLM Inference" - Zhang et al., 2026
5. "KV-Cache Compression via Learned Token Merging" - Wang et al., 2026
6. "Quantizing Large Language Models to 2 Bits Without Quality Loss" - Park et al., 2026

### Scoring

#### Paper 1: FlashDecoding++
| Criterion | Score | Reasoning |
|-----------|-------|-----------|
| Novelty | 7/10 | Builds on FlashAttention/FlashDecoding but introduces new warp-level optimizations |
| Impact | 8/10 | Direct practical impact; will be widely adopted if open-sourced |
| Rigor | 8/10 | Benchmarks on 5 model families, comparison with 4 baselines, detailed ablations |
| Relevance | 10/10 | Exactly on topic: GPU kernel optimization for LLM inference |
| Momentum | 7/10 | 15 citations in 2 weeks; discussed on HuggingFace and Twitter |
| Venue | 2/5 | arXiv preprint from a known systems lab |
**Composite: (7/10*20) + (8/10*20) + (8/10*15) + (10/10*25) + (7/10*10) + (2/5*10) = 14 + 16 + 12 + 25 + 7 + 4 = 78/100**

#### Paper 2: Speculative Decoding Revisited
| Criterion | Score | Reasoning |
|-----------|-------|-----------|
| Novelty | 5/10 | Revisits existing technique with incremental improvements |
| Impact | 6/10 | Useful but speculative decoding is well-studied |
| Rigor | 7/10 | Good baselines but limited model diversity |
| Relevance | 9/10 | Directly relevant to efficient inference |
| Momentum | 4/10 | 3 citations; limited social media attention |
| Venue | 1/5 | arXiv preprint, authors less established |
**Composite: (5/10*20) + (6/10*20) + (7/10*15) + (9/10*25) + (4/10*10) + (1/5*10) = 10 + 12 + 10.5 + 22.5 + 4 + 2 = 61/100**

#### Paper 3: MoE-Infinity
| Criterion | Score | Reasoning |
|-----------|-------|-----------|
| Novelty | 8/10 | First offloading-aware MoE system; new problem formulation |
| Impact | 7/10 | Enables running huge MoE models on consumer hardware |
| Rigor | 7/10 | Tested on 3 MoE models but limited scale experiments |
| Relevance | 8/10 | Relevant to inference efficiency, specifically MoE models |
| Momentum | 6/10 | 8 citations; trending on Papers With Code |
| Venue | 3/5 | Accepted at a top systems conference |
**Composite: (8/10*20) + (7/10*20) + (7/10*15) + (8/10*25) + (6/10*10) + (3/5*10) = 16 + 14 + 10.5 + 20 + 6 + 6 = 72.5/100**

#### Paper 4: Survey of Efficient LLM Inference
| Criterion | Score | Reasoning |
|-----------|-------|-----------|
| Novelty | 3/10 | Survey, not novel research |
| Impact | 6/10 | Useful reference but surveys rarely drive new work |
| Rigor | 6/10 | Comprehensive coverage but no new experiments |
| Relevance | 10/10 | Directly on topic |
| Momentum | 5/10 | Moderate citations for a survey |
| Venue | 2/5 | arXiv preprint |
**Composite: (3/10*20) + (6/10*20) + (6/10*15) + (10/10*25) + (5/10*10) + (2/5*10) = 6 + 12 + 9 + 25 + 5 + 4 = 61/100**

#### Paper 5: KV-Cache Compression
| Criterion | Score | Reasoning |
|-----------|-------|-----------|
| Novelty | 8/10 | Novel learned token merging approach for KV-cache |
| Impact | 8/10 | KV-cache is a major bottleneck; widely applicable |
| Rigor | 9/10 | Extensive experiments, 6 models, ablations, memory profiling |
| Relevance | 9/10 | Directly addresses inference memory efficiency |
| Momentum | 8/10 | 22 citations in first week; HuggingFace daily paper |
| Venue | 4/5 | Accepted at ICML 2026 |
**Composite: (8/10*20) + (8/10*20) + (9/10*15) + (9/10*25) + (8/10*10) + (4/5*10) = 16 + 16 + 13.5 + 22.5 + 8 + 8 = 84/100**

#### Paper 6: 2-Bit Quantization
| Criterion | Score | Reasoning |
|-----------|-------|-----------|
| Novelty | 7/10 | Pushes quantization to 2-bit without quality degradation; non-trivial |
| Impact | 7/10 | Practical for deployment but quantization is competitive space |
| Rigor | 8/10 | Tested across 4 model families with perplexity and downstream tasks |
| Relevance | 8/10 | Relevant to efficient inference via model compression |
| Momentum | 6/10 | 10 citations; code released on GitHub |
| Venue | 3/5 | Workshop paper at NeurIPS |
**Composite: (7/10*20) + (7/10*20) + (8/10*15) + (8/10*25) + (6/10*10) + (3/5*10) = 14 + 14 + 12 + 20 + 6 + 6 = 72/100**

### Final Selection: Top 3

```markdown
## Paper Selection: Top 3 for "Efficient LLM Inference"

### #1: KV-Cache Compression via Learned Token Merging (Score: 84/100)
**Scores:** Novelty: 8/10 | Impact: 8/10 | Rigor: 9/10 | Relevance: 9/10 | Momentum: 8/10 | Venue: 4/5
**Rationale:** Selected as the top paper for its novel learned token merging approach to KV-cache compression, which addresses the critical memory bottleneck in long-context inference. Accepted at ICML 2026 with exceptional early citation velocity.

### #2: FlashDecoding++ (Score: 78/100)
**Scores:** Novelty: 7/10 | Impact: 8/10 | Rigor: 8/10 | Relevance: 10/10 | Momentum: 7/10 | Venue: 2/5
**Rationale:** Selected for its direct practical impact on GPU inference speed through novel warp-level kernel optimizations, building on the highly influential FlashAttention line of work.

### #3: MoE-Infinity (Score: 72.5/100)
**Scores:** Novelty: 8/10 | Impact: 7/10 | Rigor: 7/10 | Relevance: 8/10 | Momentum: 6/10 | Venue: 3/5
**Rationale:** Selected for opening a new problem space (offloading-aware MoE inference) that enables running massive mixture-of-experts models on consumer hardware, expanding access to frontier model architectures.
```

---

## Example: Selecting Top 3 HSS Papers on "数字经济与乡村治理" (Digital Economy and Rural Governance)

### Candidate Papers (6 papers from search)

1. "平台经济下的农产品价值链重构——基于拼多多的案例研究" - 张晓明等，2025，《中国农村经济》
2. "技术治理的限度：乡村'智慧治理'的实践困境" - 赵树凯，2025，《政治学研究》
3. "数字鸿沟与农村老年人社会融入" - 陈涛，2024，《人口研究》
4. "短视频电商与乡村文化资本化" - 李红，2024，《社会学研究》
5. "数字技术与基层官僚制：赋能还是控制？" - 王诗宗，2024，《社会》
6. "中国数字乡村建设的政策演进与实践逻辑" - 周晓虹，2024，《江苏社会科学》

### Scoring (Using HSS Criteria)

#### Paper 1: 平台经济下的农产品价值链重构
| Criterion | Score | Reasoning |
|-----------|-------|-----------|
| Novelty | 7/10 | 首次系统分析拼多多模式对传统农产品价值链的重构机制 |
| Impact | 8/10 | 对理解平台经济与乡村振兴结合有重要意义，潜在政策影响大 |
| Rigor | 8/10 | 深度案例研究，结合访谈与平台数据，论证扎实 |
| Relevance | 10/10 | 直接切中数字经济赋能乡村的核心议题 |
| Academic Reach | 7/10 | CSSCI来源期刊，已被多篇后续研究引用 |
| Journal Quality | 4/5 | 《中国农村经济》，CSSCI核心期刊 |
**Composite: (7/10*15) + (8/10*20) + (8/10*15) + (10/10*25) + (7/10*10) + (4/5*15) = 10.5 + 16 + 12 + 25 + 7 + 12 = 82.5/100**

#### Paper 2: 技术治理的限度
| Criterion | Score | Reasoning |
|-----------|-------|-----------|
| Novelty | 8/10 | 提出"技术治理悖论"的理论框架，视角新颖 |
| Impact | 9/10 | 对数字治理研究有重要理论贡献，已引发学术讨论 |
| Rigor | 9/10 | 多案例比较研究，理论与实证结合紧密 |
| Relevance | 9/10 | 高度相关，聚焦乡村数字治理的核心问题 |
| Academic Reach | 8/10 | 顶级期刊，短时间内已被广泛引用与讨论 |
| Journal Quality | 5/5 | 《政治学研究》，中国社科顶级C刊 |
**Composite: (8/10*15) + (9/10*20) + (9/10*15) + (9/10*25) + (8/10*10) + (5/5*15) = 12 + 18 + 13.5 + 22.5 + 8 + 15 = 89/100**

#### Paper 3: 数字鸿沟与农村老年人
| Criterion | Score | Reasoning |
|-----------|-------|-----------|
| Novelty | 6/10 | 数字鸿沟研究已有基础，但聚焦老年农民视角有一定新意 |
| Impact | 7/10 | 对老龄化与数字化交叉问题有贡献 |
| Rigor | 7/10 | 问卷调查结合访谈，样本充足但方法较常规 |
| Relevance | 7/10 | 相关但侧重点在数字鸿沟而非经济或治理 |
| Academic Reach | 6/10 | CSSCI期刊，引用量中等 |
| Journal Quality | 4/5 | 《人口研究》，CSSCI核心期刊 |
**Composite: (6/10*15) + (7/10*20) + (7/10*15) + (7/10*25) + (6/10*10) + (4/5*15) = 9 + 14 + 10.5 + 17.5 + 6 + 12 = 69/100**

#### Paper 4: 短视频电商与文化资本化
| Criterion | Score | Reasoning |
|-----------|-------|-----------|
| Novelty | 8/10 | 从文化社会学视角分析短视频电商，跨学科创新 |
| Impact | 8/10 | 开辟新的研究视角，对理解数字经济的文化维度有贡献 |
| Rigor | 8/10 | 数字民族志方法，案例丰富，分析深入 |
| Relevance | 9/10 | 高度相关，涉及数字经济对乡村的文化与经济双重影响 |
| Academic Reach | 7/10 | 顶级期刊，学术公众号广泛讨论 |
| Journal Quality | 5/5 | 《社会学研究》，顶级C刊 |
**Composite: (8/10*15) + (8/10*20) + (8/10*15) + (9/10*25) + (7/10*10) + (5/5*15) = 12 + 16 + 12 + 22.5 + 7 + 15 = 84.5/100**

#### Paper 5: 数字技术与基层官僚制
| Criterion | Score | Reasoning |
|-----------|-------|-----------|
| Novelty | 7/10 | 结合官僚制理论分析数字治理，有一定理论创新 |
| Impact | 7/10 | 对理解数字化对基层治理的影响有价值 |
| Rigor | 8/10 | 混合方法研究，访谈与观察结合 |
| Relevance | 9/10 | 直接相关，聚焦数字技术在乡村治理中的应用 |
| Academic Reach | 6/10 | CSSCI期刊，引用量尚可 |
| Journal Quality | 4/5 | 《社会》，CSSCI核心期刊 |
**Composite: (7/10*15) + (7/10*20) + (8/10*15) + (9/10*25) + (6/10*10) + (4/5*15) = 10.5 + 14 + 12 + 22.5 + 6 + 12 = 77/100**

#### Paper 6: 数字乡村建设的政策演进
| Criterion | Score | Reasoning |
|-----------|-------|-----------|
| Novelty | 5/10 | 政策梳理型研究，原创性有限 |
| Impact | 6/10 | 为政策研究提供参考，但理论贡献较弱 |
| Rigor | 6/10 | 文献综述与政策文本分析，缺乏实证 |
| Relevance | 8/10 | 提供宏观背景，与主题相关 |
| Academic Reach | 5/10 | 引用量一般 |
| Journal Quality | 4/5 | 《江苏社会科学》，CSSCI核心期刊 |
**Composite: (5/10*15) + (6/10*20) + (6/10*15) + (8/10*25) + (5/10*10) + (4/5*15) = 7.5 + 12 + 9 + 20 + 5 + 12 = 65.5/100**

### Final Selection: Top 3

```markdown
## 论文筛选：「数字经济与乡村治理」Top 3

### #1: 技术治理的限度：乡村「智慧治理」的实践困境 (Score: 89/100)
**评分:** 新颖性: 8/10 | 影响力: 9/10 | 方法严谨性: 9/10 | 相关性: 9/10 | 学术影响: 8/10 | 期刊质量: 5/5
**选择理由:** 本文提出"技术治理悖论"的原创性理论框架，对数字治理实践中的深层矛盾进行系统分析。发表于顶级C刊《政治学研究》，已引发学术界广泛讨论，对理解乡村数字治理的限度与可能性具有重要理论价值。

### #2: 短视频电商与乡村文化资本化 (Score: 84.5/100)
**评分:** 新颖性: 8/10 | 影响力: 8/10 | 方法严谨性: 8/10 | 相关性: 9/10 | 学术影响: 7/10 | 期刊质量: 5/5
**选择理由:** 从文化社会学视角切入短视频电商研究，揭示数字经济对乡村文化资本化的双重影响机制。发表于顶级期刊《社会学研究》，运用数字民族志方法，为理解数字经济的文化维度开辟新视角。

### #3: 平台经济下的农产品价值链重构 (Score: 82.5/100)
**评分:** 新颖性: 7/10 | 影响力: 8/10 | 方法严谨性: 8/10 | 相关性: 10/10 | 学术影响: 7/10 | 期刊质量: 4/5
**选择理由:** 基于拼多多案例系统分析平台经济对传统农产品价值链的重构机制，结合深度访谈与平台数据，论证扎实。对理解数字经济赋能乡村振兴的实践路径具有重要参考价值，潜在政策影响大。
```

---

## Example 2: HSS Selection — Top 3 Papers on "数字经济与乡村治理"

### Candidate Papers (5 papers from search)

1. "数字技术嵌入与乡村治理转型" - 王某某, 《社会学研究》, 2026
2. "数字经济赋能乡村振兴的机制与路径研究" - 张某某, 《中国农村经济》, 2026
3. "农村数字治理的困境与出路" - 刘某某, 《公共管理学报》, 2026
4. "数字乡村建设中的数字鸿沟问题" - 陈某某, 《中国行政管理》, 2026
5. "乡村振兴背景下农村电商发展研究综述" - 赵某某, 《农业经济问题》, 2026

### HSS Scoring

#### Paper 1: 数字技术嵌入与乡村治理转型
| Criterion | Score | Reasoning |
|-----------|-------|-----------|
| Novelty | 8/10 | Proposes new "digital embeddedness" analytical framework for rural governance |
| Impact | 8/10 | Published in top-tier C刊 《社会学研究》; addresses hot policy topic |
| Rigor | 9/10 | Multi-site ethnographic fieldwork over 18 months, rigorous qualitative analysis |
| Relevance | 10/10 | Directly on topic: digital technology and rural governance |
| Academic Reach | 7/10 | Already discussed in several academic WeChat accounts |
| Journal Quality | 5/5 | 《社会学研究》 is a top-tier C刊 |
**HSS Composite: (8/10*15) + (8/10*20) + (9/10*15) + (10/10*25) + (7/10*10) + (5/5*15) = 12 + 16 + 13.5 + 25 + 7 + 15 = 88.5/100**

#### Paper 2: 数字经济赋能乡村振兴的机制与路径研究
| Criterion | Score | Reasoning |
|-----------|-------|-----------|
| Novelty | 6/10 | Useful empirical contribution but framework is not highly original |
| Impact | 7/10 | Solid quantitative evidence on important policy question |
| Rigor | 8/10 | Large panel dataset, proper econometric methods, robustness checks |
| Relevance | 9/10 | Directly relevant, focused on economic mechanism |
| Academic Reach | 5/10 | Recent publication, moderate early attention |
| Journal Quality | 4/5 | 《中国农村经济》 is a CSSCI source journal |
**HSS Composite: (6/10*15) + (7/10*20) + (8/10*15) + (9/10*25) + (5/10*10) + (4/5*15) = 9 + 14 + 12 + 22.5 + 5 + 12 = 74.5/100**

#### Paper 3: 农村数字治理的困境与出路
| Criterion | Score | Reasoning |
|-----------|-------|-----------|
| Novelty | 7/10 | Identifies specific barriers to digital governance adoption in rural China |
| Impact | 7/10 | Actionable policy recommendations; addresses real implementation challenges |
| Rigor | 7/10 | Case study methodology with clear analytical framework |
| Relevance | 9/10 | Directly relevant to digital governance in rural settings |
| Academic Reach | 6/10 | Cited by 3 papers; mentioned in policy discussion |
| Journal Quality | 4/5 | 《公共管理学报》 is a CSSCI source journal |
**HSS Composite: (7/10*15) + (7/10*20) + (7/10*15) + (9/10*25) + (6/10*10) + (4/5*15) = 10.5 + 14 + 10.5 + 22.5 + 6 + 12 = 75.5/100**

### Final Selection: Top 3

```markdown
## Paper Selection: Top 3 for "数字经济与乡村治理" (HSS)

### #1: 数字技术嵌入与乡村治理转型 (Score: 88.5/100)
**Scores:** Novelty: 8/10 | Impact: 8/10 | Rigor: 9/10 | Relevance: 10/10 | Academic Reach: 7/10 | Journal: 5/5
**Rationale:** Selected for its innovative "digital embeddedness" framework grounded in 18 months of multi-site ethnographic fieldwork, published in the top-tier 《社会学研究》. Combines theoretical originality with rich empirical evidence.

### #2: 农村数字治理的困境与出路 (Score: 75.5/100)
**Scores:** Novelty: 7/10 | Impact: 7/10 | Rigor: 7/10 | Relevance: 9/10 | Academic Reach: 6/10 | Journal: 4/5
**Rationale:** Selected for its practical analysis of real implementation barriers in rural digital governance, offering actionable policy recommendations grounded in systematic case comparison.

### #3: 数字经济赋能乡村振兴的机制与路径研究 (Score: 74.5/100)
**Scores:** Novelty: 6/10 | Impact: 7/10 | Rigor: 8/10 | Relevance: 9/10 | Academic Reach: 5/10 | Journal: 4/5
**Rationale:** Selected for providing rigorous quantitative evidence on the economic mechanisms linking digital economy development to rural revitalization, using comprehensive county-level panel data.
```
