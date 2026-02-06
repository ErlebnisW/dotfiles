# Research Plan: Programmatic Access to Chinese CSSCI Academic Papers

## Executive Summary

This research investigated methods for programmatically accessing Chinese CSSCI (C刊) academic papers via web-based tools. The goal is to identify which sources can reliably provide metadata (title, authors, date, journal name, abstract) through WebSearch and WebFetch tools.

## Key Findings

### ✅ RECOMMENDED SOURCES

#### 1. **NCPSSD (国家哲学社会科学文献中心)** - BEST OPTION
- **Website**: www.ncpssd.cn (formerly www.ncpssd.org)
- **Access**: FREE with registration
- **Full-text**: YES - free download after login
- **CSSCI Coverage**: Comprehensive (2,200+ domestic journals, 600+ core journals)
- **Total Papers**: 27 million records
- **WebFetch Compatible**: YES ✅
- **Metadata Available**: Title, authors, keywords, journal, date, abstract
- **API**: No official public API documented
- **Best for**: Primary source for CSSCI papers with full-text access

**Evidence**: Successfully fetched homepage showing search interface, article listings, and clear registration system.

#### 2. **Baidu Scholar (百度学术)** - GOOD FALLBACK
- **Website**: xueshu.baidu.com
- **Access**: FREE, no login required for search
- **Index Size**: 1.2 billion academic resource pages, 680 million documents
- **WebFetch Compatible**: Partial (JavaScript-heavy interface)
- **Metadata Available**: Title, authors, source, date, abstract snippets
- **Unofficial API**: GitHub project "MagicBaiduScholar" exists
- **Best for**: Discovery and metadata aggregation

**Limitation**: Initial WebFetch showed only Nuxt.js framework code, suggesting heavy JavaScript rendering. May require specialized scraping.

#### 3. **Google Scholar** - SUPPLEMENTARY
- **Website**: scholar.google.com
- **Access**: FREE, no login required
- **Chinese Paper Coverage**: Good but not comprehensive for CSSCI
- **WebFetch Compatible**: NO ❌ (CAPTCHA protection)
- **Metadata Available**: Title, authors, publication, date, citation count, snippet
- **Best for**: Finding highly-cited papers, cross-referencing

**Limitation**: CAPTCHA blocks automated access via WebFetch. Would require human verification or specialized tools.

### ⚠️ LIMITED ACCESS SOURCES

#### 4. **CNKI (中国知网)**
- **Website**: www.cnki.net
- **Access**: Requires institutional subscription
- **Free Option**: CNKI Scholar (scholar.cnki.net) - limited
- **WebFetch Result**: Redirect page only, no content accessible
- **Metadata Without Login**: Not accessible
- **Conclusion**: NOT suitable for programmatic free access

#### 5. **Wanfang Data (万方数据)**
- **Website**: www.wanfangdata.com.cn
- **Access**: Search is FREE, full-text requires subscription
- **Content**: 8,000+ journals, 5 million dissertations
- **Free Search Features**: Can export title lists without login
- **Metadata Available**: Title, authors, journal, date (abstracts unclear)
- **Best for**: Metadata-only searches if NCPSSD unavailable

#### 6. **CQVIP (维普)**
- **Website**: www.cqvip.com
- **Access**: Requires subscription for most content
- **Free Option**: CBOA (cboa.cqvip.com) for open access papers
- **Coverage**: 15,377 journals, 75.83 million papers since 1989
- **Conclusion**: Limited free access, primarily for open access subset

### ❌ NOT ACCESSIBLE

#### 7. **CSSCI Official Database**
- **Website**: cssci.nju.edu.cn
- **WebFetch Result**: Connection refused (ECONNREFUSED)
- **Access**: Likely requires institutional subscription
- **Use**: Can find official CSSCI journal list, but not for paper search

#### 8. **Other Sources Not Verified**
- **Chaoxing (超星)**: No specific access information found
- **Duxiu (读秀)**: No specific access information found
- **Chinese Preprint Servers**: Found ChinaXiv (sciences), PubScholar (sciences/engineering), but limited social sciences coverage

## CSSCI Journal List Access

**Official Source**: Nanjing University Chinese Social Science Research Evaluation Center
- **Website**: https://cssrac.nju.edu.cn/
- **Alternative**: http://cssci.nju.edu.cn/ (connection issues during testing)
- **Current Version**: CSSCI 2025-2026 source journal list
- **Coverage**: 500+ academic journals across 25 categories (law, management, economics, history, politics, etc.)
- **Update Frequency**: Every 2 years
- **Access**: Universities publish PDF lists; online query available at institutional libraries

## Recommended Implementation Strategy

### Phase 1: NCPSSD Primary Pipeline
1. Use WebFetch to access www.ncpssd.cn search interface
2. Register for free account (may need manual step initially)
3. Perform searches using advanced search operators (AND, OR, NOT)
4. Extract metadata: title, authors, keywords, journal, date, abstract
5. Download full-text PDFs for registered users

### Phase 2: Baidu Scholar Fallback
1. Investigate MagicBaiduScholar GitHub project for API access
2. Alternative: Parse search results from xueshu.baidu.com
3. Use for papers not found in NCPSSD or to cross-reference

### Phase 3: Metadata Enrichment
1. Use Wanfang Data for additional metadata (free search)
2. Cross-reference with Google Scholar for citation counts (manual when needed)
3. Filter results using official CSSCI journal list

## Technical Challenges

### Challenge 1: JavaScript-Heavy Sites
**Problem**: Baidu Scholar and some Chinese platforms use client-side rendering
**Solution**:
- Use MagicBaiduScholar API if available
- Consider using browser automation for critical sources
- Fallback to NCPSSD which showed server-rendered content

### Challenge 2: Authentication Requirements
**Problem**: Best sources (NCPSSD, CNKI, Wanfang) require registration
**Solution**:
- NCPSSD: Free registration - worth doing
- CNKI: Skip programmatic access, use alternatives
- Wanfang: Use for free metadata search only

### Challenge 3: CAPTCHA Protection
**Problem**: Google Scholar blocks automated access
**Solution**:
- Use as manual supplement only
- Focus on Chinese-native platforms (NCPSSD, Baidu Scholar)

### Challenge 4: No Official APIs
**Problem**: None of the major Chinese databases provide public APIs
**Solution**:
- Web scraping with WebFetch (NCPSSD works)
- Unofficial APIs (MagicBaiduScholar)
- Focus on sources that work with current tools

## Metadata Quality Assessment

| Source | Title | Authors | Date | Journal | Abstract | Full-text |
|--------|-------|---------|------|---------|----------|-----------|
| NCPSSD | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ (free) |
| Baidu Scholar | ✅ | ✅ | ✅ | ✅ | Partial | Links |
| Google Scholar | ✅ | ✅ | ✅ | ✅ | Snippet | Links |
| Wanfang Data | ✅ | ✅ | ✅ | ✅ | ❓ | 💰 |
| CNKI | ❌ | ❌ | ❌ | ❌ | ❌ | 💰 |
| CQVIP | Partial | Partial | Partial | Partial | ❓ | Partial |

Legend: ✅ Yes | ❌ No/Blocked | Partial = Limited | 💰 = Paid | ❓ = Unclear

## Final Recommendations

### For Reliable Metadata + Abstract Retrieval:

**Primary**: NCPSSD (www.ncpssd.cn)
- Register for free account
- Best CSSCI coverage
- Full-text access included
- WebFetch compatible
- Server-rendered content

**Secondary**: Baidu Scholar (xueshu.baidu.com)
- No registration needed
- Broad coverage
- Use MagicBaiduScholar API or careful scraping
- Good for discovery

**Tertiary**: Wanfang Data (www.wanfangdata.com.cn)
- Free metadata search
- Export title lists
- Use when NCPSSD lacks specific papers

### For CSSCI Journal Filtering:

Download official CSSCI 2025-2026 journal list from:
- https://cssrac.nju.edu.cn/
- University library websites (many publish PDF lists)
- Filter search results to only include CSSCI-indexed journals

## Open Questions for User

1. **Authentication**: Are you willing to register for a free NCPSSD account? This would unlock the best source.

2. **JavaScript Handling**: If Baidu Scholar requires JavaScript rendering, would you want to explore browser automation tools, or stick with NCPSSD only?

3. **Metadata Requirements**: Do you need full abstracts, or are abstract snippets sufficient?

4. **Volume**: How many papers do you need to retrieve? (This affects whether manual steps are acceptable)

5. **Language**: Do you need papers in Chinese only, or also English papers in Chinese journals?

6. **Time Range**: What publication date range are you targeting? (All sources have varying coverage dates)

7. **Disciplines**: Which CSSCI categories are you most interested in? (Economics, Management, Sociology, etc.)

## References

### NCPSSD
- [National Center for Philosophy and Social Sciences Documentation](https://www.ncpssd.cn/)
- [NCPSSD Overview - Fudan University](https://library.fudan.edu.cn/0f/36/c42799a659254/page.htm)

### Baidu Scholar
- [Baidu Scholar Homepage](https://xueshu.baidu.com/)
- [MagicBaiduScholar GitHub](https://github.com/1049451037/MagicBaiduScholar)

### CNKI
- [CNKI Official Site](https://www.cnki.net/)
- [CNKI - Wikipedia](https://en.wikipedia.org/wiki/CNKI)

### Wanfang Data
- [Wanfang Data Knowledge Platform](https://www.wanfangdata.com.cn/)
- [Methods for Searching Wanfang Database](https://www.oreateai.com/blog/methods-for-searching-the-wanfang-database/971f35b12ed42d05e63ce78818592dc4)

### CQVIP
- [CQVIP Official Site](https://www.cqvip.com/)
- [CBOA Free Literature Download](https://cboa.cqvip.com/apply/news?id=erg7ad_)

### CSSCI
- [Nanjing University CSSCI Center](https://cssrac.nju.edu.cn/)
- [CSSCI 2025-2026 Journal List](https://zhuanlan.zhihu.com/p/1944049468191270424)

### Google Scholar
- [Google Scholar](https://scholar.google.com/)

### Chinese Open Access
- [ACLS Open Databases for China Studies](https://www.acls.org/resources/open-databases-for-china-studies-resource-guide/)
- [Directory of Open Access Preprint Repositories](https://doapr.coar-repositories.org/repositories/)

---

**Research Completed**: 2026-02-01
**Agent**: oh-my-claudecode:researcher
**Status**: Ready for implementation planning
