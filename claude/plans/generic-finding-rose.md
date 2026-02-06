# Plan: Create `/travel-planner` Skill

## Overview

Create a new skill at `~/.claude/skills/travel-planner/` modeled after the `deep-research` skill architecture. The skill orchestrates multi-agent parallel web research to produce comprehensive, well-sourced travel plans.

## Directory Structure

```
~/.claude/skills/travel-planner/
├── SKILL.md                          # Skill definition + metadata
├── settings.local.json               # Permissions (WebSearch, WebFetch, Task, Read, Write)
├── commands/
│   └── travel-planner.md             # Main user-invocable command
└── skills/
    ├── trip-architect/               # Core itinerary builder
    │   ├── SKILL.md
    │   └── instructions.md
    ├── food-explorer/                # Food & restaurant researcher
    │   ├── SKILL.md
    │   └── instructions.md
    ├── logistics-planner/            # Transport, parking, hotels
    │   ├── SKILL.md
    │   └── instructions.md
    ├── local-intel/                  # Safety, scams, tips, cultural notes
    │   ├── SKILL.md
    │   └── instructions.md
    └── budget-calculator/            # Budget aggregation & summary
        ├── SKILL.md
        └── instructions.md
```

Plus symlink: `~/.claude/commands/travel-planner.md → ../skills/travel-planner/commands/travel-planner.md`

## Files to Create (12 files + 1 symlink)

### 1. `SKILL.md` — Skill metadata & overview

Frontmatter: `name: travel-planner`, `description: ...`
Content: Role description, workflow overview, list of sub-skills, output structure.

### 2. `settings.local.json` — Tool permissions

```json
{
  "permissions": {
    "allow": [
      "Bash(ls:*)", "Bash(done:*)",
      "WebSearch", "WebFetch",
      "mcp__exa__web_search_exa"
    ]
  }
}
```

### 3. `commands/travel-planner.md` — Main command (the core file)

**Frontmatter:**
```yaml
description: Create a comprehensive travel plan with itinerary, food guide, logistics, and budget
argument-hint: [destination] [duration] [month] [optional: free-form description of your plan, preferences, constraints]
allowed-tools: Task, WebSearch, WebFetch, mcp__exa__web_search_exa, Read, Write, AskUserQuestion
```

**Workflow (7 steps):**

1. **Smart Input Parsing & Intent Analysis** — The user provides a free-form description alongside destination/duration/month. The skill must:

   **a) Parse structured fields from $ARGUMENTS:**
   - Destination (required)
   - Duration (required)
   - Travel month (required)

   **b) Analyze the user's free-form description to extract implicit preferences:**
   - Transport mode (e.g., "我们打算自驾" → self-driving; "坐地铁为主" → public transit)
   - Travel style/pace (e.g., "带老人小孩" → relaxed; "想多玩几个地方" → packed)
   - Budget hints (e.g., "穷游" → budget; "住好一点" → mid-to-high hotel budget)
   - Specific interests (e.g., "喜欢博物馆" → museums; "主要是吃" → food-focused)
   - Group composition (solo, couple, family with kids, friends group)
   - Special requirements (e.g., wheelchair accessible, pet-friendly, halal food)
   - Any pre-planned elements (e.g., "已经订了XX酒店", "第一天到的航班是下午3点")

   **c) Only ask clarifying questions for genuinely missing/ambiguous info:**
   Use AskUserQuestion ONLY for items that cannot be inferred and are critical:
   - Output language (Chinese / English) — always ask this
   - Hotel nightly budget — ask only if not inferable from description
   - Any critical ambiguity (e.g., destination could mean city vs region)

   **Design principle**: Minimize questions. If the user said "自驾去大阪玩5天，10月，带小孩，预算一般", don't ask about transport mode, group composition, or budget tier — those are all already clear. Only ask output language + anything truly unclear.

2. **Parallel Research Phase** — Deploy 5 agents simultaneously:
   - **Agent 1 (trip-architect)**: Best attractions, routes, day-by-day itinerary, must-visit vs optional vs tourist-traps, museum/gallery hours & ticket links
   - **Agent 2 (food-explorer)**: Must-eat dishes, recommended restaurants, blacklisted places, food culture & history
   - **Agent 3 (logistics-planner)**: Transport between sites, parking info for self-driving, hotel recommendations within budget
   - **Agent 4 (local-intel)**: Safety warnings, scams, navigation tips, weather for the month, visa/entry requirements, cultural etiquette, packing suggestions
   - **Agent 5 (budget-calculator)**: Aggregate costs from all agents into a budget breakdown

3. **Source Triangulation** — Cross-reference findings across agents (same as deep-research Phase 4)

4. **Synthesis** — Combine all agent findings into a unified travel plan with:
   - Every recommendation backed by reasoning ("why this is recommended")
   - Ratings/rankings from multiple sources compared
   - Clear must-do vs optional vs avoid categorization

5. **Budget Consolidation** — Create itemized budget table

6. **Output Generation** — Write structured files to `TRAVEL/[destination]/`:
   ```
   TRAVEL/[destination]/
   ├── README.md                    # Overview & navigation
   ├── itinerary.md                 # Day-by-day plan with reasoning
   ├── food_guide.md                # Complete food report
   ├── hotel_recommendations.md     # Hotel picks with budget
   ├── transportation.md            # Getting around + parking
   ├── safety_and_tips.md           # Warnings, tips, cultural notes
   ├── budget_summary.md            # Itemized budget table
   ├── quick_reference.md           # One-page cheat sheet (key addresses, emergency numbers, phrases)
   └── sources/
       └── bibliography.md          # All source URLs
   ```

7. **Summary Output** — Print a concise itinerary summary table + total budget to the user

### 4. Sub-skill: `trip-architect/`

**Role**: Itinerary design specialist. Researches attractions, opening hours, optimal visit order, seasonal relevance.

**Key responsibilities:**
- Search for top attractions, rank by traveler reviews from multiple sources
- Categorize: Must-Visit / Recommended / Optional / Tourist Trap
- For museums/galleries: opening hours, ticket prices, booking links, best time to visit
- Design day-by-day route minimizing travel time between stops
- Justify every choice with reasoning
- Account for the specific month/season (weather, crowds, seasonal events)

### 5. Sub-skill: `food-explorer/`

**Role**: Culinary research specialist.

**Key responsibilities:**
- Research local signature dishes and their cultural background/history
- Find restaurants: Must-Eat / Worth Trying / Blacklisted (with reasons)
- Include price range, location, specialties, reservation requirements
- Research food culture, dining etiquette, tipping customs
- Note dietary restriction options (vegetarian, halal, etc.)
- Identify food markets and street food worth experiencing

### 6. Sub-skill: `logistics-planner/`

**Role**: Transportation and accommodation specialist.

**Key responsibilities:**
- Research transport options between attractions (walking, bus, metro, taxi, driving)
- For self-driving: parking lots near each attraction, approximate parking costs, driving tips
- Hotel recommendations within user's budget with reasoning (location, reviews, amenities)
- Airport/station transfer options
- Local transport cards/passes worth buying
- Ride-hailing apps available locally

### 7. Sub-skill: `local-intel/`

**Role**: Local intelligence and safety specialist.

**Key responsibilities:**
- Safety warnings: pickpocket areas, common scams, areas to avoid at night
- Navigation: which map apps work (Google Maps alternatives if needed), offline maps
- Weather for the specific travel month + packing suggestions
- Visa/entry requirements, customs restrictions
- Cultural etiquette (tipping, greetings, dress codes for religious sites)
- Emergency numbers, nearest embassy/consulate
- SIM card / connectivity options
- Useful local phrases
- Power outlet type, voltage

### 8. Sub-skill: `budget-calculator/`

**Role**: Budget aggregation specialist.

**Key responsibilities:**
- Collect cost estimates from all other agents
- Create itemized budget table by category (accommodation, food, transport, attractions, misc)
- Show daily and total estimates
- Include currency exchange tips
- Note where to save money and where not to skimp

### Additional touches from a traveler's perspective (Requirement #10):

These are woven into the sub-skills above:
- **Quick reference card** (`quick_reference.md`): Emergency numbers, key phrases, embassy address, hotel address for showing taxi drivers
- **Packing suggestions** based on season/weather (in `safety_and_tips.md`)
- **SIM/connectivity** advice (in `safety_and_tips.md`)
- **Seasonal events/festivals** happening during the travel month (in `itinerary.md`)
- **Photography spots** and best times for photos (in `itinerary.md`)
- **Day trip options** from the base city (in `itinerary.md`)

## Implementation Order

1. Create directory structure: `~/.claude/skills/travel-planner/` with all subdirectories
2. Write `SKILL.md` (skill metadata)
3. Write `settings.local.json` (permissions)
4. Write `commands/travel-planner.md` (main command — the largest and most critical file)
5. Write `skills/trip-architect/SKILL.md` + `instructions.md`
6. Write `skills/food-explorer/SKILL.md` + `instructions.md`
7. Write `skills/logistics-planner/SKILL.md` + `instructions.md`
8. Write `skills/local-intel/SKILL.md` + `instructions.md`
9. Write `skills/budget-calculator/SKILL.md` + `instructions.md`
10. Create symlink: `~/.claude/commands/travel-planner.md`

## Verification

1. Run `ls -la ~/.claude/skills/travel-planner/` to confirm structure
2. Run `ls -la ~/.claude/commands/travel-planner.md` to confirm symlink
3. Test that `/travel-planner 大阪 5天 10月 自驾，带小孩，预算一般，喜欢吃` triggers the skill correctly
4. Verify intent parsing correctly extracts: transport=self-driving, group=family with kids, budget=moderate, interest=food-focused
5. Verify only output language is asked (other prefs already clear from description)
6. Verify parallel agents launch and produce output in `TRAVEL/[destination]/`

## Key Design Decisions

- **English skill files, bilingual output**: All `.md` skill files written in English per requirement #9. The command asks user to choose output language (Chinese or English) and passes that preference to all agents.
- **5 parallel agents** (matching deep-research's multi-agent pattern) for maximum research coverage.
- **Reasoning for every recommendation**: Every attraction, restaurant, hotel includes a "why" explanation per requirement #7.
- **Structured output directory**: `TRAVEL/[destination]/` mirrors `RESEARCH/[topic]/` pattern from deep-research.
- **Quick reference card**: Added as a traveler-friendly bonus — a single printable page with all essentials.
