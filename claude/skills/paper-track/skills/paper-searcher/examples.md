# Paper Searcher - Examples

## Example 1: Searching for Papers on "Test-Time Compute Scaling"

### Input
```
Topic: "test-time compute scaling"
Days: 14
Sources: all
```

### Search Queries Executed

```
# arXiv
WebSearch: site:arxiv.org "test-time compute" scaling 2026
WebSearch: site:arxiv.org "inference-time compute" scaling LLM

# Semantic Scholar
WebSearch: site:semanticscholar.org "test-time compute scaling" 2026

# Google Scholar
WebSearch: "test-time compute scaling" research paper 2026

# Papers With Code
WebSearch: site:paperswithcode.com test-time compute scaling

# HuggingFace
WebSearch: site:huggingface.co/papers test-time compute
```

### Sample Output

```markdown
## Search Results: test-time compute scaling (last 14 days)

**Sources searched:** arXiv, Semantic Scholar, Google Scholar, Papers With Code, HuggingFace
**Time window:** 2026-01-18 to 2026-02-01
**Total papers found:** 12 (after deduplication)

### Papers

1. **Scaling LLM Test-Time Compute Optimally Can Be More Effective Than Scaling Parameters**
   - Authors: Snell, C. et al.
   - Date: 2026-01-25
   - Abstract: We investigate how to optimally allocate test-time compute for large language models. We find that scaling test-time compute with search against a process reward model can outperform a 14x larger model...
   - URL: https://arxiv.org/abs/2601.XXXXX
   - Citations: 8
   - Found on: arXiv, Semantic Scholar, HuggingFace

2. **Tree Search for Language Model Agents**
   - Authors: Koh, J. et al.
   - Date: 2026-01-22
   - Abstract: We propose a framework for applying tree search algorithms at test time for language model agents. Our approach uses a learned value function to guide Monte Carlo Tree Search...
   - URL: https://arxiv.org/abs/2601.XXXXX
   - Citations: 3
   - Found on: arXiv, Papers With Code

3. **Compute-Optimal Inference for Reasoning Tasks**
   - Authors: Zhang, Y. et al.
   - Date: 2026-01-19
   - Abstract: We study the compute-optimal frontier for inference-time reasoning. Given a fixed inference budget, we characterize the optimal strategy for allocating compute between...
   - URL: https://arxiv.org/abs/2601.XXXXX
   - Citations: 1
   - Found on: arXiv, Google Scholar
```

---

## Example 2: Searching for Papers on "Multimodal Retrieval-Augmented Generation"

### Input
```
Topic: "multimodal RAG"
Days: 7
Sources: arxiv
```

### Search Queries Executed

```
# arXiv only
WebSearch: site:arxiv.org "multimodal RAG" 2026
WebSearch: site:arxiv.org "multimodal retrieval-augmented generation" 2026
WebSearch: site:arxiv.org vision language retrieval augmented generation
```

### Sample Output

```markdown
## Search Results: multimodal RAG (last 7 days)

**Sources searched:** arXiv
**Time window:** 2026-01-25 to 2026-02-01
**Total papers found:** 5 (after deduplication)

### Papers

1. **VisRAG: Vision-Language Retrieval-Augmented Generation with Multi-Granularity Evidence**
   - Authors: Li, W. et al.
   - Date: 2026-01-28
   - Abstract: We propose VisRAG, a framework for retrieval-augmented generation that operates over both textual and visual evidence. Unlike prior RAG systems that convert images to text...
   - URL: https://arxiv.org/abs/2601.XXXXX
   - Citations: N/A
   - Found on: arXiv

2. **Benchmarking Multimodal RAG: When Does Retrieval Actually Help?**
   - Authors: Chen, X. et al.
   - Date: 2026-01-26
   - Abstract: We present MM-RAGBench, a comprehensive benchmark for evaluating multimodal retrieval-augmented generation across 8 domains. We find that naive retrieval augmentation...
   - URL: https://arxiv.org/abs/2601.XXXXX
   - Citations: N/A
   - Found on: arXiv
```

---

## Example 3: HSS Research on "数字人文研究方法" (Digital Humanities Methods)

### Input
```
Topic: "数字人文研究方法"
Days: 30
Sources: hss
Domain: hss
```

### Search Queries Executed

```
# Baidu Scholar
WebSearch: 百度学术 数字人文研究方法 CSSCI 2026
WebSearch: site:xueshu.baidu.com 数字人文 核心期刊

# NCPSSD
WebSearch: site:ncpssd.cn 数字人文研究方法
WebSearch: 国家哲学社会科学文献中心 数字人文 2025

# Google Scholar Chinese Mode
WebSearch: 数字人文研究方法 site:cnki.net OR site:wanfangdata.com.cn 2026
WebSearch: 数字人文 CSSCI 期刊论文 2025

# CNKI Metadata
WebSearch: 知网 数字人文 核心期刊 2026
WebSearch: site:cnki.net 数字人文研究方法
```

### Sample Output

```markdown
## Search Results: 数字人文研究方法 (last 30 days)

**Sources searched:** Baidu Scholar, NCPSSD, Google Scholar (Chinese), CNKI
**Time window:** 2026-01-02 to 2026-02-01
**Total papers found:** 8 (after deduplication)

### Papers

1. **数字人文视域下的历史文献知识图谱构建研究**
   - Authors: 张晓明 et al.
   - Date: 2026-01-15
   - Abstract: 本文探讨数字人文背景下历史文献知识图谱的构建方法，提出基于本体的历史实体识别与关系抽取框架...
   - URL: https://ncpssd.cn/Literature/articleDetail?id=1234567
   - Journal: 图书情报工作
   - CSSCI: Yes
   - Citations: 2
   - Found on: NCPSSD, Baidu Scholar, CNKI
   - Full-text links: [NCPSSD](https://ncpssd.cn/Literature/articleDetail?id=1234567) | [CNKI](https://cnki.net/kcms2/article/abstract?v=xxx) | [Baidu Scholar](https://xueshu.baidu.com/xxx)

2. **文本挖掘技术在古典文学研究中的应用**
   - Authors: 李华, 王芳
   - Date: 2026-01-10
   - Abstract: 运用文本挖掘、主题模型和情感分析等数字人文方法，对唐诗宋词进行量化研究，揭示古典文学的主题演变规律...
   - URL: https://xueshu.baidu.com/usercenter/paper/show?paperid=xxx
   - Journal: 文学遗产
   - CSSCI: Yes
   - Citations: 5
   - Found on: Baidu Scholar, Google Scholar, CNKI
   - Full-text links: [CNKI](https://cnki.net/kcms2/article/abstract?v=xxx) | [Baidu Scholar](https://xueshu.baidu.com/xxx)

3. **数字人文背景下的社会网络分析方法研究**
   - Authors: 赵明远 et al.
   - Date: 2026-01-08
   - Abstract: 本研究系统梳理社会网络分析在数字人文领域的应用，提出适用于中国历史研究的社会网络建模框架...
   - URL: https://ncpssd.cn/Literature/articleDetail?id=7654321
   - Journal: 史学理论研究
   - CSSCI: Yes
   - Citations: 1
   - Found on: NCPSSD, Baidu Scholar
   - Full-text links: [NCPSSD](https://ncpssd.cn/Literature/articleDetail?id=7654321) | [Baidu Scholar](https://xueshu.baidu.com/xxx)
```

---

## Example 4: HSS Search — "数字经济与乡村振兴" (Digital Economy and Rural Revitalization)

### Input
```
Topic: "数字经济与乡村振兴"
Days: 30
Sources: all
Domain: hss
```

### Domain Detection
Topic contains HSS signals: "经济", "乡村振兴" → domain = hss

### Search Queries Executed

```
# Baidu Scholar (百度学术)
WebSearch: 百度学术 数字经济 乡村振兴 CSSCI 2026
WebSearch: site:xueshu.baidu.com 数字经济 乡村振兴

# NCPSSD (国家哲学社会科学文献中心)
WebSearch: site:ncpssd.cn 数字经济 乡村振兴
WebSearch: 国家哲学社会科学文献中心 数字经济 乡村振兴 2026

# Google Scholar (Chinese mode)
WebSearch: 数字经济 乡村振兴 site:cnki.net OR site:wanfangdata.com.cn 2026

# CNKI metadata
WebSearch: cnki 数字经济 乡村振兴 CSSCI 2026
```

### Sample Output

```markdown
## Search Results: 数字经济与乡村振兴 (last 30 days)

**Sources searched:** Baidu Scholar, NCPSSD, Google Scholar (Chinese), CNKI
**Time window:** 2026-01-02 to 2026-02-01
**Total papers found:** 18 (after deduplication)

### Papers

1. **数字经济赋能乡村振兴的机制与路径研究**
   - Authors: 张某某 等
   - Date: 2026-01
   - Journal: 《中国农村经济》 (CSSCI: Yes)
   - Abstract: 本文基于全国2800个县域面板数据，实证分析了数字经济发展对乡村振兴的影响机制。研究发现，数字经济通过提升农业生产效率、拓宽农产品销售渠道、促进农村人力资本积累三条路径...
   - Links: [NCPSSD](https://www.ncpssd.cn/...) | [CNKI](https://www.cnki.net/...) | [Baidu Scholar](https://xueshu.baidu.com/...)
   - Citations: 5

2. **农村电商平台与农户收入增长：基于数字包容性视角**
   - Authors: 李某某, 王某某
   - Date: 2026-01
   - Journal: 《经济研究》 (CSSCI: Yes)
   - Abstract: 以数字包容性为分析框架，利用中国家庭追踪调查(CFPS)数据，考察农村电商平台使用对农户收入的影响...
   - Links: [NCPSSD](https://www.ncpssd.cn/...) | [CNKI](https://www.cnki.net/...) | [Baidu Scholar](https://xueshu.baidu.com/...)
   - Citations: 2

3. **数字乡村建设的实践模式与制度创新——基于东部六省的比较研究**
   - Authors: 陈某某 等
   - Date: 2026-01
   - Journal: 《管理世界》 (CSSCI: Yes)
   - Abstract: 基于东部六省数字乡村建设试点的比较案例研究，归纳总结了三种典型实践模式...
   - Links: [NCPSSD](https://www.ncpssd.cn/...) | [Baidu Scholar](https://xueshu.baidu.com/...)
   - Citations: 1
```

---

## Example 5: No Results Found

### Input
```
Topic: "quantum transformer neural architecture"
Days: 3
Sources: all
```

### Sample Output

```markdown
## Search Results: quantum transformer neural architecture (last 3 days)

**Sources searched:** arXiv, Semantic Scholar, Google Scholar, Papers With Code, HuggingFace
**Time window:** 2026-01-29 to 2026-02-01
**Total papers found:** 0

No papers matching "quantum transformer neural architecture" were found in the last 3 days.

**Suggestions:**
- Expand the time window: try `--days 14` or `--days 30`
- Broaden search terms: try "quantum machine learning" or "quantum neural networks"
- Try individual sources: `--source arxiv` may have preprints not yet indexed elsewhere
```
