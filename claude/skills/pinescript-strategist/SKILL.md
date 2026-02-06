---
name: pinescript-strategist
description: Comprehensive PineScript trading strategy analysis, creation, evaluation, and optimization for TradingView. Use when users request (1) Finding or researching best PineScript strategies for specific assets/timeframes (e.g., "find best ETH 1h strategy"), (2) Creating new trading strategies from descriptions, (3) Evaluating or reviewing existing PineScript code, (4) Optimizing strategies for better profitability, (5) Backtesting analysis and parameter tuning, or (6) Any PineScript trading strategy development work. Supports both English and Chinese output based on user preference.
---

# PineScript Strategist

Comprehensive workflow for researching, creating, evaluating, and optimizing TradingView PineScript trading strategies with maximum profitability focus.

## Workflow Decision Tree

```
User Request
    ├─→ "Find best strategy for [ASSET] [TIMEFRAME]"
    │       → Research Phase → Strategy Analysis → Implementation → Evaluation
    │
    ├─→ "Create strategy for [description]"
    │       → Requirements Gathering → Strategy Design → Implementation → Evaluation
    │
    ├─→ "Evaluate/improve this strategy [code]"
    │       → Code Analysis → Weakness Identification → Research → Optimization
    │
    └─→ General trading strategy question
            → Consult references/ → Provide guidance
```

## Language Preference

**First interaction:** Ask user: "Would you like responses in English or Chinese? / 您希望用英文还是中文回复？"

Store preference and maintain throughout session.

## Phase 1: Research & Discovery

**When to use:** User requests finding best strategies for specific asset/timeframe.

### Step 1: Define Search Criteria

Extract from user request:
- **Asset:** BTC, ETH, stocks, forex, etc.
- **Timeframe:** 1m, 5m, 15m, 1h, 4h, 1D, etc.
- **Strategy Type:** Trend-following, mean reversion, breakout, scalping, etc. (if specified)
- **Risk Tolerance:** Conservative, moderate, aggressive (ask if unclear)

### Step 2: Comprehensive Web Research

Use **web search** to find top strategies. Search queries:

```
"best [ASSET] [TIMEFRAME] pinescript strategy"
"profitable [ASSET] trading strategy tradingview"
"[ASSET] [TIMEFRAME] high win rate strategy"
"top performing [ASSET] pinescript indicators"
```

**Sources to prioritize:**
1. TradingView public library (high engagement/likes)
2. Trading strategy blogs and forums
3. GitHub repositories with backtesting results
4. Academic papers on algorithmic trading
5. YouTube tutorials with proven results

### Step 3: Strategy Comparative Analysis

Create comparison table for top 5-7 found strategies:

| Strategy Name | Type | Win Rate | Profit Factor | Max Drawdown | Complexity | Timeframes |
|--------------|------|----------|---------------|--------------|------------|------------|
| Strategy A   | ...  | ...      | ...           | ...          | Low/Med/High| ...        |

**Evaluation Criteria:**
- **Profitability:** Profit factor >1.5 preferred
- **Consistency:** Win rate >50% for trend, >40% for breakout
- **Risk Management:** Max drawdown <25%
- **Robustness:** Works across different market conditions
- **Adaptability:** Tunable parameters
- **Code Quality:** Clean, documented, maintainable

**Ranking Formula:**
```
Score = (Profit_Factor × 0.35) + (Win_Rate × 0.25) + ((100-Max_Drawdown) × 0.20) + (Robustness × 0.20)
```

### Step 4: Research Summary

Output structured research findings:
- **Top 3 recommended strategies** with rationale
- **Key patterns identified** across successful strategies
- **Common indicators used** (RSI, MACD, Bollinger Bands, etc.)
- **Risk management techniques** (stop-loss, position sizing)
- **Optimal entry/exit signals** for the asset/timeframe

## Phase 2: Strategy Implementation

**When to use:** Creating new strategy OR implementing researched strategy.

### Step 1: Strategy Specification

Define core components:

```
STRATEGY SPECIFICATION
═══════════════════════════════════
Asset: [e.g., BTC/USD]
Timeframe: [e.g., 1h]
Type: [e.g., Trend-following with momentum confirmation]

Entry Conditions:
  - Long: [condition 1], [condition 2]
  - Short: [condition 1], [condition 2]

Exit Conditions:
  - Take Profit: [percentage/price]
  - Stop Loss: [percentage/price]
  - Trailing Stop: [if applicable]

Indicators:
  - Primary: [e.g., EMA 50/200 crossover]
  - Confirmation: [e.g., RSI > 50]
  - Filter: [e.g., Volume > SMA(20)]

Position Sizing: [fixed % / dynamic]
Risk Per Trade: [1-3% typical]
```

### Step 2: PineScript Implementation

**Template Structure:**
```pinescript
//@version=5
strategy("[Strategy Name]", overlay=true,
         initial_capital=10000,
         default_qty_type=strategy.percent_of_equity,
         default_qty_value=10,
         commission_type=strategy.commission.percent,
         commission_value=0.1)

// ═══════════════════════════════════
// INPUTS
// ═══════════════════════════════════
// [Parameter inputs with sensible defaults]

// ═══════════════════════════════════
// CALCULATIONS
// ═══════════════════════════════════
// [Indicator calculations]

// ═══════════════════════════════════
// ENTRY CONDITIONS
// ═══════════════════════════════════
longCondition = [condition logic]
shortCondition = [condition logic]

// ═══════════════════════════════════
// EXIT CONDITIONS
// ═══════════════════════════════════
// [Stop loss and take profit logic]

// ═══════════════════════════════════
// STRATEGY EXECUTION
// ═══════════════════════════════════
if (longCondition)
    strategy.entry("Long", strategy.long)

if (shortCondition)
    strategy.entry("Short", strategy.short)

// ═══════════════════════════════════
// VISUALIZATION
// ═══════════════════════════════════
// [Plot indicators and signals]
```

**Implementation Best Practices:**
- Use `input.*` functions for all tunable parameters
- Add clear comments for each section
- Include visualization for key signals
- Implement proper risk management
- Consider slippage and commission

### Step 3: Code Quality Checklist

Before delivery, verify:
- [ ] No compilation errors
- [ ] All variables properly declared
- [ ] Logical entry/exit conditions
- [ ] Risk management implemented
- [ ] Parameters exposed as inputs
- [ ] Clear visualization
- [ ] Comments in English (code) + user's preferred language (descriptions)

## Phase 3: Strategy Evaluation

**When to use:** After implementation OR when user provides existing code.

### Step 1: Code Analysis

For existing strategies, analyze:

**Structure Quality:**
- Version compatibility (//@version=5 preferred)
- Code organization and readability
- Proper use of PineScript functions
- Security settings (overlay, pyramiding, etc.)

**Logic Quality:**
- Entry/exit condition clarity
- Signal confirmation mechanisms
- Risk management implementation
- Position sizing logic

**Performance Indicators:**
- Does it repaint? (Critical flaw)
- Look-ahead bias? (Forward referencing)
- Overfitting signs (too many conditions)
- Realistic commission/slippage?

### Step 2: Backtesting Guidance

**Instruct user to test on TradingView:**

```
BACKTESTING PROTOCOL
════════════════════════════════════
1. Apply strategy to [ASSET] [TIMEFRAME] chart
2. Set date range: Minimum 1 year, prefer 3+ years
3. Record these metrics:
   - Net Profit %
   - Total Trades
   - Win Rate %
   - Profit Factor
   - Max Drawdown %
   - Sharpe Ratio
   - Average Win / Average Loss

4. Test across different market conditions:
   - Bull market period
   - Bear market period
   - Sideways/consolidation period

5. Forward test (out-of-sample):
   - Reserve last 3-6 months for validation
   - Compare in-sample vs out-of-sample performance
```

### Step 3: Performance Analysis

**Interpret results:**

```
PERFORMANCE BENCHMARKS
════════════════════════════════════
Excellent: Profit Factor >2.0, Win Rate >55%, Max DD <20%
Good:      Profit Factor >1.5, Win Rate >50%, Max DD <30%
Mediocre:  Profit Factor >1.2, Win Rate >45%, Max DD <40%
Poor:      Below mediocre thresholds
```

**Red Flags:**
- Win rate >80% (likely overfitting or repainting)
- Very few trades (<50 in 1 year)
- Max drawdown >50%
- Profit factor <1.0
- Performance degrades significantly out-of-sample

## Phase 4: Optimization

**When to use:** Strategy shows promise but needs improvement.

### Step 1: Identify Weaknesses

Common issues and solutions:

| Weakness | Diagnostic | Solution |
|----------|-----------|----------|
| Low win rate | Too many false signals | Add confirmation filter |
| High drawdown | No stop-loss or too wide | Tighter risk management |
| Few trades | Conditions too strict | Relax entry requirements |
| Many trades | Conditions too loose | Add quality filters |
| Poor profit factor | Exits too early/late | Optimize take-profit logic |
| Inconsistent results | Market regime sensitivity | Add market condition filter |

### Step 2: Parameter Optimization

**Systematic approach:**

1. **Identify tunable parameters:**
   - Indicator periods (EMA length, RSI period)
   - Threshold values (RSI overbought/oversold)
   - Risk parameters (stop-loss %, take-profit %)

2. **Optimization strategy:**
   ```
   Primary Parameter (most impact):
     Test range: [start, end, step]
     Example: EMA fast period [10, 30, 2]

   Secondary Parameters:
     Optimize after primary is set

   Risk Parameters:
     Optimize last (tend to overfit)
   ```

3. **Use TradingView Strategy Tester:**
   - Deep Backtesting > Optimization tab
   - Run parameter sweeps
   - Choose balance between in-sample and out-of-sample performance

### Step 3: Advanced Enhancements

**Research-driven improvements:**

For each weakness, search:
```
"how to improve [specific issue] in trading strategy"
"[ASSET] best indicator for [problem]"
"pinescript [feature] implementation"
```

**Common enhancement patterns:**

1. **Add Market Regime Filter:**
   ```pinescript
   // Trend strength filter
   adx = ta.adr(14)
   trendingMarket = adx > 25

   // Only trade in trending conditions
   if (longCondition and trendingMarket)
       strategy.entry("Long", strategy.long)
   ```

2. **Multi-Timeframe Confirmation:**
   ```pinescript
   // Higher timeframe trend
   htfTrend = request.security(syminfo.tickerid, "240", ta.ema(close, 50))
   confirmTrend = close > htfTrend  // Only long when above HTF EMA
   ```

3. **Volatility-Based Position Sizing:**
   ```pinescript
   atr = ta.atr(14)
   riskAmount = strategy.equity * 0.02  // 2% risk
   positionSize = riskAmount / atr
   ```

4. **Session Filters:**
   ```pinescript
   // Trade only during active sessions
   inSession = (hour >= 9 and hour <= 16)
   ```

### Step 4: Revised Implementation

Output improved strategy with:
- **Change log:** What was modified and why
- **Expected impact:** How changes should improve metrics
- **New parameters:** Additional tunable inputs
- **Testing notes:** Specific areas to validate

## Phase 5: Deliverables

### Final Output Format

**1. Executive Summary** (English + User's Language)
```
STRATEGY: [Name]
ASSET: [Target]
TIMEFRAME: [Period]
TYPE: [Category]

EXPECTED PERFORMANCE:
- Profit Factor: [X.XX]
- Win Rate: [XX%]
- Max Drawdown: [XX%]

KEY FEATURES:
- [Feature 1]
- [Feature 2]
- [Feature 3]

RISK LEVEL: [Low/Medium/High]
```

**2. Complete PineScript Code**
- Fully commented
- Ready to copy-paste into TradingView
- All parameters exposed for tuning

**3. Usage Instructions**
```
IMPLEMENTATION GUIDE
════════════════════════════════════
1. Open TradingView and create new strategy
2. Copy-paste the code
3. Apply to [ASSET] [TIMEFRAME] chart
4. Recommended initial settings:
   - [Parameter 1]: [Value]
   - [Parameter 2]: [Value]
5. Run backtest over [date range]
6. Adjust parameters based on results
```

**4. Optimization Guide**
- Parameter tuning recommendations
- Market-specific adjustments
- Risk management calibration

**5. Maintenance Notes**
- When to review (monthly/quarterly)
- Warning signs strategy is failing
- Market condition adaptations

## Advanced Features Reference

For complex strategies, see detailed guides:

- **Multi-Indicator Strategies:** [references/multi-indicator-patterns.md](references/multi-indicator-patterns.md)
- **Risk Management Systems:** [references/risk-management.md](references/risk-management.md)
- **Machine Learning Integration:** [references/ml-optimization.md](references/ml-optimization.md)
- **Common Strategy Templates:** [assets/strategy-templates/](assets/strategy-templates/)

## Research Resources

**When researching strategies, prioritize:**

1. **TradingView Public Library**
   - Filter by: Most liked, Recent updates
   - Check: Author reputation, code quality, documentation

2. **Strategy Validation Sources**
   - Quantified Strategies
   - QuantConnect/QuantRocket forums
   - Academic papers (SSRN, ArXiv)

3. **Technical Analysis Resources**
   - Investopedia (definitions)
   - TradingView educational content
   - Technical Analysis books (Murphy, Elder, Pring)

## Quality Assurance

Before final delivery:

- [ ] Code compiles without errors
- [ ] All logic is sound and non-repainting
- [ ] Risk management is implemented
- [ ] Visualization aids understanding
- [ ] Documentation is comprehensive
- [ ] User can copy-paste and run immediately
- [ ] Optimization guidance is actionable
- [ ] Output is in user's preferred language

## Iterative Improvement Protocol

After user tests strategy:

1. **Request Results:**
   "Please share your backtesting results: net profit %, win rate, profit factor, max drawdown, and number of trades."

2. **Analyze Performance:**
   Compare to benchmarks, identify gaps

3. **Research Solutions:**
   Web search for specific improvements

4. **Implement Enhancements:**
   Modify code with explanations

5. **Repeat Until Optimal:**
   Continue cycle until user satisfied or diminishing returns

## Success Metrics

Strategy is considered **successful** when:
- Profit factor >1.5
- Win rate >50% (trend) or >45% (breakout)
- Max drawdown <30%
- Consistent across 2+ years backtest
- Out-of-sample validation passes
- User satisfied with risk/reward profile
