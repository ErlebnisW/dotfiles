# Paper Searcher - Instructions

## Search Strategy Per Source

### 1. arXiv Search

arXiv is the primary source for AI/ML preprints. Use these search patterns:

**WebSearch queries:**
```
site:arxiv.org [topic keywords] [current year]
site:arxiv.org abs [topic keywords]
arxiv [topic] submitted [month] [year]
```

**WebSearch with domain filtering:**
```python
WebSearch(query="[topic keywords] [year]", allowed_domains=["arxiv.org"])
```

**Tips:**
- arXiv papers have IDs like `2401.12345`. The first 4 digits encode year+month.
- Use specific technical terms rather than broad categories
- For sub-fields, add category prefixes: "cs.CL" (NLP), "cs.CV" (vision), "cs.LG" (ML), "cs.AI" (AI)
- Search for both the topic AND related benchmark/dataset names

**Metadata extraction via WebFetch:**
Fetch the arXiv abstract page (`arxiv.org/abs/XXXX.XXXXX`) to extract:
- Title (in the `<h1>` tag)
- Authors (in the author list)
- Abstract (in the `<blockquote>` section)
- Submission date
- Categories

### 2. Semantic Scholar Search

Semantic Scholar provides rich citation data and paper metadata.

**WebSearch queries:**
```
site:semanticscholar.org [topic keywords] [current year]
semanticscholar.org [topic] [year]
```

**Tips:**
- Semantic Scholar is best for getting citation counts and influence metrics
- Look for the "Highly Influential Citations" count
- Cross-reference arXiv papers here for citation data
- The URL format is: `semanticscholar.org/paper/[title-slug]/[hash]`

### 3. Google Scholar Search

Google Scholar has the broadest academic coverage.

**WebSearch queries:**
```
[topic keywords] research paper [current year]
[topic keywords] conference paper [year] NeurIPS OR ICML OR ICLR OR ACL OR CVPR
"[exact topic phrase]" [year] filetype:pdf
```

**Tips:**
- Google Scholar includes published versions, not just preprints
- Use quotes for exact phrase matching
- Add venue names to find peer-reviewed versions
- Results often include citations counts in snippets

### 4. Papers With Code Search

Papers With Code links papers to their implementations.

**WebSearch queries:**
```
site:paperswithcode.com [topic keywords]
paperswithcode.com methods [topic]
paperswithcode.com sota [topic benchmark]
```

**Tips:**
- Great for finding papers with available code
- Check the "trending" and "latest" sections
- Look for benchmark leaderboard entries
- Papers here often have reproducible results

### 5. HuggingFace Papers Search

HuggingFace curates trending ML papers daily.

**WebSearch queries:**
```
site:huggingface.co/papers [topic keywords]
huggingface.co papers [topic] [year]
```

**Tips:**
- HuggingFace papers page shows community-upvoted papers
- Good for finding papers with models/datasets on the Hub
- Check the daily papers page for very recent work

## HSS (Humanities & Social Sciences) Search Sources

The following sources are used when `domain = hss` or `domain = auto`. They are optimized for Chinese humanities and social sciences (人文社科) literature.

### 6. Baidu Scholar (百度学术) Search

Baidu Scholar is the primary Chinese academic search engine with broad coverage of Chinese journals.

**WebSearch queries:**
```
百度学术 [topic] CSSCI [current year]
site:xueshu.baidu.com [topic] [year]
百度学术 [topic] 核心期刊
```

**Tips:**
- Add "CSSCI" or "核心期刊" to prioritize high-quality journal papers
- Baidu Scholar results often include links to CNKI, Wanfang, and NCPSSD for full text
- For English topics in HSS, translate to Chinese first for better coverage
- Extract: title, authors, journal name, year, abstract snippet, citation count

**Metadata extraction via WebFetch:**
Fetch the Baidu Scholar detail page to extract:
- Full title and subtitle
- All authors with affiliations
- Journal name and issue number
- Abstract (often more complete than search snippet)
- Links to full-text sources (CNKI, NCPSSD, Wanfang)
- Citation count within Chinese academic network

### 7. NCPSSD (国家哲学社会科学文献中心) Search

NCPSSD is China's official free platform for social science literature, covering 2200+ journals.

**WebSearch queries:**
```
site:ncpssd.cn [topic]
ncpssd.cn [topic] [journal name if known]
国家哲学社会科学文献中心 [topic] [year]
```

**Tips:**
- NCPSSD provides FREE full-text access after registration
- Coverage is primarily social sciences (philosophy, economics, law, sociology, political science, education, literature, history, etc.)
- Search results may require WebFetch to parse the detail page
- The URL format is typically: `ncpssd.cn/Literature/articleDetail?id=[ID]`

**Metadata extraction via WebFetch:**
Fetch the NCPSSD article page to extract:
- Full title
- Authors and affiliations
- Journal name, year, volume, issue, pages
- Full abstract (Chinese and sometimes English)
- Keywords
- Full-text PDF link (free after login)

### 8. Google Scholar Chinese Mode Search

Google Scholar with Chinese-specific queries to find Chinese HSS papers.

**WebSearch queries:**
```
[中文topic] site:cnki.net OR site:wanfangdata.com.cn [current year]
[中文topic] CSSCI 期刊论文 [year]
[中文topic] 学术论文 [year]
```

**Tips:**
- Combine Chinese topic terms with site filters for targeted results
- Google Scholar often shows citation counts even for Chinese papers
- Results may link to CNKI (paid) or other repositories
- Use this as a cross-reference source to validate findings from Baidu Scholar

### 9. CNKI Metadata Search

CNKI (China National Knowledge Infrastructure / 知网) is the largest Chinese academic database. While full text requires paid access, metadata is freely available from search results.

**WebSearch queries:**
```
cnki [topic] CSSCI [current year]
知网 [topic] 核心期刊 [year]
site:cnki.net [topic]
```

**Tips:**
- CNKI metadata from search result snippets includes: title, authors, journal, abstract preview
- Full text requires institutional access or payment — note this limitation
- Use CNKI primarily for metadata cross-referencing and citation counts
- The URL format is: `cnki.net/kcms2/article/abstract?v=[ID]`

**Metadata extraction:**
From search result snippets, extract:
- Title
- Authors
- Journal name
- Year and issue
- Abstract preview (first 200-300 characters)
- Download/citation count (if visible in snippet)

## Deduplication Strategy

After collecting results from all sources, deduplicate:

1. **By arXiv ID**: If two results share the same arXiv ID (e.g., `2401.12345`), keep the one with the most metadata
2. **By DOI**: If two results share the same DOI, merge their metadata
3. **By title similarity**: If two titles match >90% (case-insensitive, ignoring punctuation), treat as duplicates
   - Keep the version with the most complete metadata
   - Merge citation counts (take the higher number)
   - Note all source URLs
4. **By title similarity (HSS/Chinese papers)**: For Chinese-language papers that lack arXiv IDs or DOIs:
   - Exact title match → definite duplicate
   - Title similarity >85% (accounting for punctuation and minor wording differences) → likely duplicate
   - When merging, prefer the version with: NCPSSD link (free full text) > Baidu Scholar link > CNKI link
   - Merge citation counts and source URLs from all sources

## Time Window Filtering

Calculate the cutoff date: `cutoff = today - N days`

For each paper:
- Extract the publication/submission date
- If the date is before the cutoff, exclude it
- If the date cannot be determined, include it but flag as "date uncertain"
- For arXiv papers, use the submission date (v1), not the latest revision date

## Output Format

Return a structured list sorted by date (newest first):

```markdown
## Search Results: [topic] (last N days)

**Sources searched:** arXiv, Semantic Scholar, Google Scholar, Papers With Code, HuggingFace
**Time window:** [start date] to [end date]
**Total papers found:** X (after deduplication)

### Papers

1. **[Title]**
   - Authors: [First Author] et al.
   - Date: YYYY-MM-DD
   - Abstract: [First 2-3 sentences]
   - URL: [canonical link]
   - Citations: [count or N/A]
   - Found on: [source1, source2]
   - Journal: [journal name] (for HSS papers)
   - CSSCI: Yes/No (for HSS papers, based on whether search included CSSCI filtering)
   - Full-text links: [NCPSSD](url) | [CNKI](url) | [Baidu Scholar](url) (for HSS papers, as available)

2. **[Title]**
   ...
```

## Error Handling

- If a source returns no results, note it and continue with other sources
- If WebFetch fails on a paper URL, use whatever metadata is available from the search results
- If fewer than 3 papers are found, suggest broadening the topic or extending the time window
- Always report which sources were searched and which returned results
