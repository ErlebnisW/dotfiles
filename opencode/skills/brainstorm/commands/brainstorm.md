---
description: Brainstorm research ideas for a given problem/bottleneck. Explore papers, generate solution paths, rank by feasibility and novelty for top AI conferences, and output MD + LaTeX report.
argument-hint: [research problem, bottleneck, or path to a file describing your problem]
allowed-tools: Task, WebSearch, WebFetch, mcp__exa__web_search_exa, mcp__exa__get_code_context_exa, Read, Write, Edit, AskUserQuestion
---

# Research Brainstorm

Execute a comprehensive research brainstorming session for the given problem using multi-agent parallel exploration and systematic idea evaluation.

## Input

$ARGUMENTS

## Workflow

### Step 1: Problem Understanding

Use the **problem-refiner** skill to:
1. Parse user input (text description or file path)
2. Ask clarifying questions about the research problem, current bottleneck, domain, and constraints
3. Produce a structured problem statement with:
   - Core research problem
   - Current approach and its limitations
   - Specific bottleneck or challenge
   - Target venue (e.g., NeurIPS, ICML, ICLR, CVPR, ACL, AAAI, etc.)
   - Mathematical formulation (if applicable)
   - Desired properties of the solution

### Step 2: Literature Search (Parallel Agents)

Deploy 3-5 parallel **literature-scout** agents to search for:
- Agent 1: Directly related papers addressing the same or similar problems
- Agent 2: Papers from adjacent fields with transferable techniques
- Agent 3: Recent top-conference papers (last 2 years) with novel methodologies
- Agent 4: Survey papers and benchmarks in the target area
- Agent 5 (optional): Foundational/classic papers that established key techniques

Each agent returns: paper title, authors, venue, year, key contribution, relevance score (1-10), and specific techniques that could be borrowed.

### Step 3: Idea Generation

Use the **idea-generator** skill to:
1. Synthesize literature findings
2. Generate 5-8 candidate solution paths, each with:
   - Core idea description
   - Mathematical formulation or algorithm sketch
   - Which existing techniques it builds upon (with references)
   - Key novelty claim
   - Potential experiments to validate

### Step 4: Idea Evaluation & Ranking

Use the **idea-evaluator** skill to score each idea on:
- **Feasibility** (1-10): Can this be implemented and validated within reasonable time/compute?
- **Novelty** (1-10): How original is this compared to existing work? Would reviewers see it as a real contribution?
- **Impact** (1-10): If it works, how significant would the results be?
- **Publishability** (1-10): Realistic chance of acceptance at a top AI conference?
- **Risk** (Low/Medium/High): What could go wrong?

Produce a ranked list sorted by composite score = 0.25*Feasibility + 0.30*Novelty + 0.25*Impact + 0.20*Publishability.

### Step 5: Report Generation

Use the **report-synthesizer** skill to generate:

1. **Markdown Report** (`RESEARCH/[topic]/brainstorm_report.md`):
   - Executive summary with top recommendation
   - Problem statement
   - Literature landscape overview
   - All candidate ideas with detailed analysis
   - Ranked comparison table
   - Top 3 recommended paths with justification
   - Key references with specific borrowable techniques
   - Suggested next steps

2. **LaTeX Summary** (`RESEARCH/[topic]/brainstorm_summary.tex`):
   - Formal problem formulation with math
   - Each idea's mathematical formulation
   - Comparison table
   - Complete bibliography in BibTeX format

## Output Language

Ask the user whether they prefer the output in **English** or **Chinese (中文)**. Default to the language the user used in their input if not specified.

## Output Directory Structure

```
RESEARCH/[topic]/
├── brainstorm_report.md        # Main report (full analysis)
├── brainstorm_summary.tex      # LaTeX with math formulas and bibliography
├── references.bib              # BibTeX references
├── ideas/
│   ├── idea_1_[name].md        # Detailed write-up per idea
│   ├── idea_2_[name].md
│   └── ...
├── literature/
│   ├── related_papers.md       # Paper summaries and relevance
│   └── technique_map.md        # Which techniques map to which ideas
└── notes/
    └── problem_statement.md    # Structured problem definition
```

Begin the research brainstorming process now.
