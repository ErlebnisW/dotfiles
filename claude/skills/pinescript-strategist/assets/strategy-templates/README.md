# PineScript Strategy Templates

This directory contains ready-to-use strategy templates for different trading approaches.

## Available Templates

### 1. Trend Following Template
**File:** `trend-following-template.pine`

**Best for:**
- Crypto (BTC, ETH) on 1h-4h timeframes
- Strongly trending markets
- Medium-term holds (days to weeks)

**Features:**
- EMA crossover system (12/26 default)
- RSI momentum confirmation
- Volume filter
- ADX trend strength filter
- ATR-based position sizing
- Trailing stop loss option

**Parameters to tune:**
- EMA periods (test 10/20, 12/26, 20/50)
- RSI thresholds (oversold/overbought)
- ADX threshold (25 = minimum trend strength)

### 2. Mean Reversion Template
**File:** `mean-reversion-template.pine`

**Best for:**
- Range-bound markets
- High volatility assets
- Shorter timeframes (15m-1h)
- Stocks, forex in sideways markets

**Features:**
- Bollinger Bands (20, 2.0 default)
- RSI oversold/overbought (30/70)
- High volatility filter (ATR-based)
- ADX filter to avoid trending markets
- Multiple take-profit modes (BB center, fixed RR, opposite band)

**Parameters to tune:**
- BB length and standard deviation (20/2.0 conservative, 15/2.5 aggressive)
- RSI levels (30/70 standard, 20/80 extreme)
- Max ADX for range (30 = prefer ranging markets)

### 3. Breakout Template
**File:** `breakout-template.pine`

**Best for:**
- High-momentum assets (crypto, tech stocks)
- Daily and 4h timeframes
- Capturing strong directional moves
- News-driven markets

**Features:**
- Multi-type breakout detection (High/Low, Close, Donchian)
- Volume surge confirmation
- MACD momentum confirmation
- Consolidation filter (only trade after tight ranges)
- Trend filter (only breakouts in trend direction)
- Trailing stop for big moves

**Parameters to tune:**
- Lookback period (20 standard, 50 for weekly, 10 for intraday)
- Volume multiplier (1.5 moderate, 2.0 strong surge only)
- Risk:Reward ratio (3:1 aggressive, 2:1 conservative)

## How to Use These Templates

### Step 1: Choose Your Template

Based on market conditions:
- **Trending market (ADX > 25)** → Use Trend Following
- **Range-bound (ADX < 20)** → Use Mean Reversion
- **After consolidation + strong catalyst** → Use Breakout

### Step 2: Copy to TradingView

1. Open TradingView
2. Click Pine Editor
3. Copy-paste template code
4. Save and add to chart

### Step 3: Initial Configuration

**For all templates:**
- Set asset and timeframe
- Configure risk (default 2% per trade)
- Set commission (0.1% for crypto typical)

**Asset-specific adjustments:**
- Crypto: Higher volatility → wider stops, larger ATR multipliers
- Stocks: Lower volatility → tighter stops, smaller ATR multipliers
- Forex: Very tight stops, high leverage consideration

### Step 4: Backtest

Run Strategy Tester on at least 1 year of data:
1. Open Strategy Tester tab
2. Check Performance Summary
3. Target metrics:
   - Profit Factor > 1.5
   - Win Rate > 50% (trend) or 45% (breakout)
   - Max Drawdown < 30%

### Step 5: Optimize

Use Strategy Tester > Deep Backtesting > Optimization:
1. Start with primary indicator period
2. Then optimize confirmation thresholds
3. Finally tune risk parameters
4. Verify on out-of-sample data

## Combining Templates

### Ensemble Approach

Use voting system across templates:

```pinescript
// Run all 3 templates
trendSignal = /* trend template logic */
reversionSignal = /* mean reversion logic */
breakoutSignal = /* breakout logic */

// Enter when 2 out of 3 agree
longVotes = (trendSignal ? 1 : 0) + (reversionSignal ? 1 : 0) + (breakoutSignal ? 1 : 0)
longCondition = longVotes >= 2
```

### Regime Switching

Automatically switch templates based on market regime:

```pinescript
// Detect regime
adx = ta.dmi(14, 14)[2]
atr = ta.atr(14)
atrMA = ta.sma(atr, 50)

// Choose strategy
if (adx > 25)
    // Use trend following
else if (adx < 20 and atr > atrMA * 1.2)
    // Use mean reversion
else if (atr < atrMA * 0.8)
    // Use breakout (after consolidation)
```

## Common Modifications

### Add Session Filter

Only trade during specific hours:

```pinescript
// Add to inputs
startHour = input.int(9, "Start Hour", minval=0, maxval=23)
endHour = input.int(16, "End Hour", minval=0, maxval=23)

// Add to entry condition
inSession = hour >= startHour and hour <= endHour
longCondition = longCondition and inSession
```

### Add Multi-Timeframe Confirmation

Require higher timeframe agreement:

```pinescript
// Higher timeframe trend (e.g., 4h trend for 1h strategy)
htfEMA = request.security(syminfo.tickerid, "240", ta.ema(close, 50))
htfBullish = close > htfEMA

// Add to long condition
longCondition = longCondition and htfBullish
```

### Add Daily Loss Limit

Stop trading after daily loss threshold:

```pinescript
// Track daily P&L
var float dailyStartEquity = strategy.equity
var int lastDay = dayofmonth

if (dayofmonth != lastDay)
    dailyStartEquity := strategy.equity
    lastDay := dayofmonth

maxDailyLoss = input.float(5.0, "Max Daily Loss %")
currentDailyLoss = (strategy.equity - dailyStartEquity) / dailyStartEquity * 100
allowTrading = currentDailyLoss > -maxDailyLoss

// Add to entry condition
longCondition = longCondition and allowTrading
```

## Template Comparison

| Template | Win Rate Target | Profit Factor | Max DD | Trade Frequency | Best Timeframe |
|----------|----------------|---------------|---------|-----------------|----------------|
| Trend Following | 50-60% | 1.5-2.5 | 20-30% | Low (5-20/mo) | 1h-1D |
| Mean Reversion | 55-65% | 1.3-2.0 | 25-35% | High (30-100/mo) | 15m-4h |
| Breakout | 40-50% | 2.0-3.5 | 25-40% | Medium (10-30/mo) | 4h-1D |

## Troubleshooting

### Template Not Performing Well

**Low Win Rate (<40%):**
- Add more confirmation filters
- Increase entry threshold (stronger signals only)
- Check if wrong template for market regime

**High Drawdown (>40%):**
- Reduce position size
- Tighten stop loss
- Add daily loss limit

**Too Few Trades (<5/month):**
- Relax entry conditions
- Reduce confirmation requirements
- Try shorter timeframe

**Too Many Trades (>100/month):**
- Add more filters
- Increase signal threshold
- Try longer timeframe

### Strategy Repainting

If strategy looks perfect in backtest but fails in real-time:

**Check for:**
1. Using `security()` without `lookahead=barmerge.lookahead_off`
2. Using `var` variables incorrectly
3. Confirming logic uses `[0]` (current bar) instead of `[1]` (previous bar)

**Fix:**
```pinescript
// Bad (repaints)
longCondition = ta.crossover(emaFast, emaSlow)

// Good (no repaint)
longCondition = ta.crossover(emaFast, emaSlow)[1]
```

## Next Steps

After selecting and tuning a template:

1. **Paper trade** for 1-2 weeks
2. **Forward test** on recent data not used in optimization
3. **Monitor live** for 1 month with small position sizes
4. **Scale up** gradually if performance validates
5. **Review quarterly** and re-optimize if performance degrades

## Support Resources

- **TradingView Pine Script Documentation:** https://www.tradingview.com/pine-script-docs/
- **Template Issues:** Check references/ folder for advanced patterns
- **Strategy Help:** Consult SKILL.md workflow for optimization guidance
