# Plan: 扩展 paper-track 兼容人文社科

## 目标

修改 paper-track skill，使其能同时服务 STEM（当前功能）和人文社科（HSS）领域，核心变化：
- 新增中文 C 刊搜索源（百度学术、NCPSSD、Google Scholar 中文）
- 自动检测领域 or 手动 `--domain stem|hss` 切换
- 人文社科专用评分体系（C 刊权重、学术影响力替代 citation momentum）
- 分析模板适配（人文社科论文结构不同于理工科）
- 尽量提供全文链接（NCPSSD/知网/百度学术链接）

## 需修改的文件

### 1. `SKILL.md` — 主技能文档
**路径**: `/Users/richard/.claude/skills/paper-track/SKILL.md`
**改动**:
- 新增 `--domain stem|hss|auto` 参数说明（默认 auto）
- 搜索源表格增加百度学术、NCPSSD
- 输出结构不变，但说明 HSS 模式下论文分析会适配

### 2. `commands/paper-track.md` — 主命令
**路径**: `/Users/richard/.claude/skills/paper-track/commands/paper-track.md`
**改动**:
- Phase 1 (Scope): 增加领域自动检测逻辑
  - 关键词匹配: 经济/管理/社会/法律/政治/历史/哲学/文学/语言/教育/传播/艺术 → HSS
  - 其他/AI/ML/CS/physics/biology → STEM
  - `--domain` 参数可覆盖自动检测
- Phase 2 (Search): HSS 模式使用不同搜索源组合
  - HSS: 百度学术(主) + NCPSSD(主) + Google Scholar(辅) + CNKI 元数据(辅)
  - STEM: 保持原有 arXiv + Semantic Scholar + Google Scholar + Papers With Code + HuggingFace
- Phase 3 (Select): 根据 domain 选择不同评分权重
- Phase 4 (Analyze): 根据 domain 选择不同分析模板

### 3. `commands/search-papers.md` — 搜索命令
**路径**: `/Users/richard/.claude/skills/paper-track/commands/search-papers.md`
**改动**:
- 新增 `--domain` 和 `--source` 扩展: `baidu|ncpssd|cnki|all`
- HSS 搜索结果增加期刊名和 CSSCI 标记

### 4. `commands/analyze-paper.md` — 单篇分析命令
**改动**: 增加 `--domain` 参数，选择分析模板

### 5. `commands/field-overview.md` — 领域概览命令
**改动**: 增加 `--domain` 参数

### 6. `skills/paper-searcher/instructions.md` — 搜索指令 ⭐核心修改
**路径**: `/Users/richard/.claude/skills/paper-track/skills/paper-searcher/instructions.md`
**改动** (最大):

新增 HSS 搜索源:

**百度学术 (Baidu Scholar)** — 主要中文源:
- 查询: `site:xueshu.baidu.com [topic] [year]` 或直接 WebSearch `百度学术 [topic] CSSCI`
- 提取: 标题、作者、期刊名、年份、摘要片段
- 全文链接: 通常提供知网/万方/NCPSSD 跳转链接
- 优势: 免费、覆盖广、中文搜索质量高

**NCPSSD (国家哲学社会科学文献中心)** — 免费全文源:
- 查询: WebSearch `site:ncpssd.cn [topic]` 或 `ncpssd.cn [topic] [journal]`
- 提取: 完整元数据 + 摘要 + 全文链接（免费注册后可下载）
- 优势: 官方免费平台，覆盖 2200+ 期刊
- 限制: 仅社科类，搜索功能可能需要 WebFetch 解析

**Google Scholar 中文模式**:
- 查询: `[中文topic] site:cnki.net OR site:wanfangdata.com.cn`
- 提取: 标题、作者、引用次数、期刊

**CNKI 元数据** (辅助):
- 查询: WebSearch `cnki [topic] CSSCI [year]`
- 提取: 标题、作者、期刊、摘要（搜索结果页可见）
- 限制: 全文需付费，但元数据可从搜索结果获取

新增去重策略:
- 中文论文无 arXiv ID/DOI 时，按标题精确匹配去重
- 标题相似度 >85% 视为同一论文

新增 CSSCI 标记:
- 对搜索结果标注是否来自 CSSCI 来源期刊
- 使用期刊名匹配（内置常见 CSSCI 核心期刊列表不现实，改为搜索时优先添加 "CSSCI" 或 "核心期刊" 关键词过滤）

### 7. `skills/paper-searcher/examples.md`
**改动**: 新增 HSS 搜索示例

### 8. `skills/paper-selector/instructions.md` — 评分指令 ⭐核心修改
**路径**: `/Users/richard/.claude/skills/paper-track/skills/paper-selector/instructions.md`
**改动**:

新增 HSS 评分体系（与 STEM 并列）:

| 标准 | STEM 权重 | HSS 权重 | HSS 说明 |
|------|-----------|----------|---------|
| 新颖性 (Novelty) | 20% | 15% | 理论创新或视角创新 |
| 影响潜力 (Impact) | 20% | 20% | 对学科发展的推动 |
| 方法论严谨性 (Rigor) | 15% | 15% | 论证逻辑、史料/数据质量 |
| 相关性 (Relevance) | 25% | 25% | 与用户话题的匹配度 |
| 学术传播度 (Momentum) | 10% | 10% | 引用、转载、学术公众号讨论 |
| 期刊质量 (Venue) | 10% | 15% | C刊权重提升 |

HSS 期刊质量评分 (0-5):
- 5: 《中国社会科学》《历史研究》《经济研究》等顶刊
- 4: CSSCI 来源期刊（核心）
- 3: CSSCI 扩展版期刊
- 2: 北大核心期刊（非 CSSCI）
- 1: 普通学术期刊
- 0: 非学术来源

### 9. `skills/paper-selector/examples.md`
**改动**: 新增 HSS 评分示例

### 10. `skills/paper-analyzer/instructions.md` — 分析指令 ⭐核心修改
**路径**: `/Users/richard/.claude/skills/paper-track/skills/paper-analyzer/instructions.md`
**改动**:

新增 HSS 分析模板（8节，适配人文社科论文结构）:

| 节 | STEM 版 | HSS 版 |
|---|---------|--------|
| 1 | 必读理由 | 必读理由（同） |
| 2 | 核心洞见 | 核心论点 (Core Argument) — 中心命题/假说 |
| 3 | 技术方法 | 研究方法与材料 — 理论框架、史料来源、田野方法、数据来源 |
| 4 | 最难问题与解法 | 关键论证 (Key Argumentation) — 最精彩的论证链条/证据运用 |
| 5 | 关键结果 | 核心发现与结论 |
| 6 | 局限性 | 局限性与商榷空间 — 包括"可进一步讨论的问题" |
| 7 | 与其他工作联系 | 学术脉络 (Scholarly Context) — 学术史定位、对话的学者和理论 |
| 8 | 一句话总结 | 一句话总结（同） |

信息获取适配:
- 中文论文通常无 arXiv/blog/Twitter，改为搜索:
  - 学术公众号解读
  - 知乎讨论
  - 学者个人主页/简介
  - NCPSSD 全文链接
  - 百度学术引用信息

全文链接生成:
- 尽量为每篇论文提供: NCPSSD 链接 + 知网链接 + 百度学术链接
- 格式: `[NCPSSD](https://www.ncpssd.cn/...) | [知网](https://www.cnki.net/...) | [百度学术](https://xueshu.baidu.com/...)`

### 11. `skills/paper-analyzer/examples.md`
**改动**: 新增 HSS 分析示例

### 12. `skills/field-synthesizer/instructions.md`
**路径**: `/Users/richard/.claude/skills/paper-track/skills/field-synthesizer/instructions.md`
**改动**:
- Section 4 (Key Players): 适配中文学术体系——重点高校/研究所、学者、课题组
- Section 6 (Opportunities): HSS 模式增加"国家社科基金选题趋势"作为信号
- 期刊质量评估: 使用 CSSCI 而非影响因子

### 13. `skills/field-synthesizer/examples.md`
**改动**: 新增 HSS 综述示例

## 不修改的文件

- `settings.local.json` — 权限不变（已有 WebSearch/WebFetch）
- 输出目录结构不变 — `RESEARCH/paper-track/[topic-slug]/`

## 实现要点

### 领域自动检测逻辑

```
HSS 关键词（中文）: 经济, 管理, 社会, 法律, 政治, 历史, 哲学, 文学, 语言, 教育, 传播, 艺术,
  民族, 宗教, 人口, 考古, 新闻, 图书馆, 马克思, 伦理, 美学, 心理, 公共政策, 国际关系,
  乡村振兴, 社会治理, 文化, 制度

HSS 关键词（英文）: sociology, economics (non-quantitative context), political science,
  history, philosophy, literature, linguistics, anthropology, law, education,
  communication studies, area studies

STEM 信号: arXiv, model, algorithm, dataset, benchmark, neural, transformer,
  GPU, training, inference, code, API
```

当同时含两类关键词时默认 auto（两种源都搜），`--domain` 可强制指定。

### C刊论文深度分析策略

由于中文 C 刊论文全文不易自动获取，分析深度策略:
1. **首先**: WebFetch 尝试获取 NCPSSD 全文页面
2. **其次**: WebFetch 百度学术详情页获取扩展摘要
3. **再次**: WebSearch 搜索该论文的学术公众号解读、书评
4. **兜底**: 基于标题+摘要+期刊信息进行分析，明确标注"基于摘要的分析"
5. **始终**: 提供 NCPSSD/知网/百度学术的链接，方便用户自行获取全文

## 步骤 0: 备份原始 skill

在做任何修改之前，先完整备份:
```bash
cp -r /Users/richard/.claude/skills/paper-track /Users/richard/.claude/skills/paper-track.bak
```

## 验证方案

用户自行测试，实现完成后不自动运行测试。
