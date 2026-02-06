---
name: brainstorm
description: Brainstorm research ideas for a given problem or bottleneck. Explores papers via parallel literature scouts, generates solution paths with mathematical formulations, ranks by feasibility/novelty/impact/publishability for top AI conferences, and outputs MD + LaTeX report. Use when a user wants to brainstorm research directions, explore solution paths for a research bottleneck, generate paper ideas, or prepare a research exploration report. Triggers on "brainstorm", "research ideas", "paper ideas", "solution paths", or when a user describes a research problem and wants candidate approaches.
---

# Research Brainstorm

Multi-agent research brainstorming system that transforms a research problem into ranked, actionable research directions with full reports.

## Workflow

1. **Problem Refining** — `problem-refiner` skill parses input (text or file), asks clarifying questions, outputs structured problem statement
2. **Literature Search** — 3-5 parallel `literature-scout` agents search for directly related papers, adjacent-field techniques, recent top-conference work, surveys/benchmarks, and foundational papers
3. **Idea Generation** — `idea-generator` skill synthesizes literature into 5-8 candidate ideas with math formulations, novelty claims, and experiment sketches
4. **Idea Evaluation** — `idea-evaluator` skill scores each idea (Feasibility 0.25, Novelty 0.30, Impact 0.25, Publishability 0.20) and simulates reviewer concerns
5. **Report Synthesis** — `report-synthesizer` skill produces final deliverables

## Sub-Skills

| Skill | Role |
|-------|------|
| `problem-refiner` | Structure raw problem into formal statement with bottleneck analysis |
| `literature-scout` | Parallel paper search (5 scout types: direct, adjacent, recent, survey, foundational) |
| `idea-generator` | Synthesize literature into 5-8 concrete research ideas |
| `idea-evaluator` | Score and rank ideas, simulate reviewer concerns |
| `report-synthesizer` | Produce MD report, LaTeX summary, BibTeX references |

## Output Structure

```
RESEARCH/[topic]/
├── brainstorm_report.md        # Main report
├── brainstorm_summary.tex      # LaTeX with math and bibliography
├── references.bib              # BibTeX references
├── ideas/
│   └── idea_N_[name].md        # Per-idea detailed write-up
├── literature/
│   ├── related_papers.md       # Paper summaries
│   └── technique_map.md        # Technique-to-idea mapping
└── notes/
    └── problem_statement.md    # Structured problem definition
```

## Assets

- `assets/brainstorm_template.tex` — LaTeX template with custom scoring commands and table structure. Use as the base for `brainstorm_summary.tex`.

## Output Language

Match the language of user input. Ask if ambiguous. Math notation stays in LaTeX regardless of language.
