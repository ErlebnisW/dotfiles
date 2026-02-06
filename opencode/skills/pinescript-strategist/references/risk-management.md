# Risk Management Systems for PineScript

## Core Risk Management Principles

### 1. Position Sizing Methods

#### Fixed Percentage Risk
```pinescript
// Risk 2% of equity per trade
riskPercent = input.float(2.0, "Risk Per Trade (%)", minval=0.1, maxval=10)
riskAmount = strategy.equity * (riskPercent / 100)

// Calculate position size based on stop loss distance
stopLossPercent = input.float(3.0, "Stop Loss (%)", minval=0.5, maxval=20)
positionSize = (riskAmount / (close * stopLossPercent / 100)) / close

strategy.entry("Long", strategy.long, qty=positionSize)
```

#### ATR-Based Position Sizing
```pinescript
// Dynamic position sizing based on volatility
atrLength = input.int(14, "ATR Length")
atrMultiplier = input.float(2.0, "ATR Multiplier for Stop")
riskPercent = input.float(2.0, "Risk Per Trade (%)")

atr = ta.atr(atrLength)
stopDistance = atr * atrMultiplier
riskAmount = strategy.equity * (riskPercent / 100)

// Position size = Risk Amount / Stop Distance
positionSize = riskAmount / stopDistance

if (longCondition)
    strategy.entry("Long", strategy.long, qty=positionSize)
    stopPrice = close - stopDistance
    strategy.exit("Stop", "Long", stop=stopPrice)
```

#### Fixed Fractional Method
```pinescript
// Kelly Criterion variation
winRate = input.float(55, "Historical Win Rate (%)", minval=0, maxval=100) / 100
avgWin = input.float(2.0, "Average Win", minval=0.1)
avgLoss = input.float(1.0, "Average Loss", minval=0.1)

// Kelly % = (Win Rate × Avg Win - (1 - Win Rate) × Avg Loss) / Avg Win
kellyPercent = (winRate * avgWin - (1 - winRate) * avgLoss) / avgWin
// Use half Kelly for safety
safeKelly = kellyPercent * 0.5

positionSizePercent = math.max(1, math.min(safeKelly * 100, 10))  // Cap at 10%
strategy.entry("Long", strategy.long, qty=strategy.equity * positionSizePercent / 100 / close)
```

### 2. Stop Loss Strategies

#### Percentage-Based Stop Loss
```pinescript
stopLossPercent = input.float(3.0, "Stop Loss (%)")
takeProfitPercent = input.float(6.0, "Take Profit (%)")

if (longCondition)
    strategy.entry("Long", strategy.long)
    stopPrice = close * (1 - stopLossPercent / 100)
    targetPrice = close * (1 + takeProfitPercent / 100)
    strategy.exit("Exit", "Long", stop=stopPrice, limit=targetPrice)
```

#### ATR-Based Dynamic Stop Loss
```pinescript
atrLength = input.int(14, "ATR Length")
atrStopMultiplier = input.float(2.0, "Stop Loss ATR Multiplier")
atrTargetMultiplier = input.float(3.0, "Take Profit ATR Multiplier")

atr = ta.atr(atrLength)

if (longCondition)
    strategy.entry("Long", strategy.long)
    stopPrice = close - (atr * atrStopMultiplier)
    targetPrice = close + (atr * atrTargetMultiplier)
    strategy.exit("Exit", "Long", stop=stopPrice, limit=targetPrice)
```

#### Trailing Stop Loss
```pinescript
trailPercent = input.float(2.0, "Trailing Stop (%)")
trailOffset = input.float(4.0, "Activation Profit (%)")

if (longCondition)
    strategy.entry("Long", strategy.long)

// Trailing stop activates after 4% profit
strategy.exit("Trail", "Long",
             trail_points=trailOffset * close / 100,
             trail_offset=trailPercent * close / 100)
```

#### Support/Resistance Stop Loss
```pinescript
// Place stop below recent swing low
lookback = input.int(20, "Lookback for Swing Low")
swingLow = ta.lowest(low, lookback)

if (longCondition)
    strategy.entry("Long", strategy.long)
    stopPrice = swingLow * 0.995  // Slightly below swing low
    strategy.exit("Exit", "Long", stop=stopPrice)
```

### 3. Take Profit Methods

#### Multiple Take Profit Levels
```pinescript
// Scale out at multiple targets
if (longCondition)
    strategy.entry("Long", strategy.long, qty=3)

    // Target 1: 2% profit, close 33%
    strategy.exit("TP1", "Long", limit=close * 1.02, qty_percent=33)

    // Target 2: 4% profit, close 33%
    strategy.exit("TP2", "Long", limit=close * 1.04, qty_percent=33)

    // Target 3: 6% profit, close remaining
    strategy.exit("TP3", "Long", limit=close * 1.06)
```

#### Risk-Reward Ratio Based
```pinescript
riskRewardRatio = input.float(2.0, "Risk:Reward Ratio", minval=1.0, maxval=5.0)
stopLossPercent = input.float(2.0, "Stop Loss %")

takeProfitPercent = stopLossPercent * riskRewardRatio

if (longCondition)
    strategy.entry("Long", strategy.long)
    stopPrice = close * (1 - stopLossPercent / 100)
    targetPrice = close * (1 + takeProfitPercent / 100)
    strategy.exit("Exit", "Long", stop=stopPrice, limit=targetPrice)
```

#### Trailing Take Profit
```pinescript
// Lock in profits while letting winners run
activationPercent = input.float(5.0, "Activation Profit %")
trailPercent = input.float(2.0, "Trail Distance %")

var float highestPrice = na
var bool trailingActive = false

if (strategy.position_size > 0)
    if (na(highestPrice) or close > highestPrice)
        highestPrice := close

    profitPercent = (close - strategy.position_avg_price) / strategy.position_avg_price * 100

    if (profitPercent >= activationPercent)
        trailingActive := true

    if (trailingActive)
        trailPrice = highestPrice * (1 - trailPercent / 100)
        strategy.exit("Trail TP", "Long", stop=trailPrice)
else
    highestPrice := na
    trailingActive := false
```

### 4. Maximum Drawdown Protection

#### Daily Loss Limit
```pinescript
// Stop trading if daily loss exceeds threshold
maxDailyLoss = input.float(5.0, "Max Daily Loss %")

var float dailyStartEquity = strategy.equity
var int lastDay = dayofmonth

if (dayofmonth != lastDay)
    dailyStartEquity := strategy.equity
    lastDay := dayofmonth

currentDailyLoss = (strategy.equity - dailyStartEquity) / dailyStartEquity * 100

allowTrading = currentDailyLoss > -maxDailyLoss

if (longCondition and allowTrading)
    strategy.entry("Long", strategy.long)
```

#### Consecutive Loss Protection
```pinescript
// Reduce position size after consecutive losses
maxConsecutiveLosses = input.int(3, "Max Consecutive Losses")

var int consecutiveLosses = 0
var float lastTradeProfit = 0

// Track losses
if (strategy.closedtrades > 0)
    lastTradeProfit := strategy.closedtrades.profit(strategy.closedtrades - 1)
    if (lastTradeProfit < 0)
        consecutiveLosses += 1
    else
        consecutiveLosses := 0

// Reduce size after losses
positionMultiplier = consecutiveLosses >= maxConsecutiveLosses ? 0.5 : 1.0

if (longCondition)
    baseSize = strategy.equity * 0.1
    adjustedSize = baseSize * positionMultiplier
    strategy.entry("Long", strategy.long, qty=adjustedSize / close)
```

### 5. Portfolio-Level Risk Controls

#### Maximum Open Risk
```pinescript
// Limit total portfolio risk exposure
maxOpenRisk = input.float(6.0, "Max Portfolio Risk %")
riskPerTrade = input.float(2.0, "Risk Per Trade %")

currentOpenRisk = strategy.position_size * strategy.position_avg_price * (riskPerTrade / 100)
totalRiskPercent = currentOpenRisk / strategy.equity * 100

allowNewTrade = totalRiskPercent < maxOpenRisk

if (longCondition and allowNewTrade)
    strategy.entry("Long", strategy.long)
```

#### Correlation-Based Position Sizing
```pinescript
// Reduce size when trading correlated assets
// Note: Requires external correlation data or manual adjustment

correlationFactor = input.float(1.0, "Correlation Adjustment", minval=0.5, maxval=1.0)
basePositionSize = strategy.equity * 0.1

adjustedSize = basePositionSize * correlationFactor

if (longCondition)
    strategy.entry("Long", strategy.long, qty=adjustedSize / close)
```

## Complete Risk Management Template

```pinescript
//@version=5
strategy("Risk Management Template", overlay=true)

// ═══════════════════════════════════
// RISK PARAMETERS
// ═══════════════════════════════════
riskPercent = input.float(2.0, "Risk Per Trade (%)", minval=0.1, maxval=10)
stopLossATR = input.float(2.0, "Stop Loss (ATR Multiple)", minval=0.5, maxval=5)
takeProfitRR = input.float(2.0, "Risk:Reward Ratio", minval=1, maxval=5)
maxDailyLoss = input.float(5.0, "Max Daily Loss (%)", minval=1, maxval=20)
useTrailingStop = input.bool(true, "Use Trailing Stop")
trailingPercent = input.float(2.0, "Trailing Stop %", minval=0.5, maxval=10)

// ═══════════════════════════════════
// DAILY LOSS PROTECTION
// ═══════════════════════════════════
var float dailyStartEquity = strategy.equity
var int lastDay = dayofmonth

if (dayofmonth != lastDay)
    dailyStartEquity := strategy.equity
    lastDay := dayofmonth

currentDailyLoss = (strategy.equity - dailyStartEquity) / dailyStartEquity * 100
allowTrading = currentDailyLoss > -maxDailyLoss

// ═══════════════════════════════════
// POSITION SIZING
// ═══════════════════════════════════
atr = ta.atr(14)
stopDistance = atr * stopLossATR
riskAmount = strategy.equity * (riskPercent / 100)
positionSize = riskAmount / stopDistance

// ═══════════════════════════════════
// ENTRY LOGIC (Your strategy here)
// ═══════════════════════════════════
longCondition = ta.crossover(ta.ema(close, 12), ta.ema(close, 26))

// ═══════════════════════════════════
// TRADE EXECUTION
// ═══════════════════════════════════
if (longCondition and allowTrading and strategy.position_size == 0)
    strategy.entry("Long", strategy.long, qty=positionSize)
    stopPrice = close - stopDistance
    targetPrice = close + (stopDistance * takeProfitRR)

    if (useTrailingStop)
        strategy.exit("Exit", "Long", stop=stopPrice,
                     trail_points=targetPrice - close,
                     trail_offset=close * trailingPercent / 100)
    else
        strategy.exit("Exit", "Long", stop=stopPrice, limit=targetPrice)

// ═══════════════════════════════════
// VISUALIZATION
// ═══════════════════════════════════
plot(strategy.position_size > 0 ? strategy.position_avg_price : na,
     "Entry", color=color.blue, linewidth=2, style=plot.style_linebr)
```

## Risk Management Checklist

Before deploying any strategy:

- [ ] **Position sizing defined** (fixed %, ATR-based, or Kelly)
- [ ] **Stop loss implemented** (% or ATR-based)
- [ ] **Take profit defined** (fixed, RR-based, or trailing)
- [ ] **Daily loss limit set** (5-10% typical)
- [ ] **Maximum position size capped** (typically 10-25% of equity)
- [ ] **Commission and slippage included** in calculations
- [ ] **Risk per trade < 3%** of equity
- [ ] **Risk:Reward ratio ≥ 1.5:1**
- [ ] **Consecutive loss protection** considered
- [ ] **Backtested across market conditions** (bull, bear, sideways)

## Common Risk Management Mistakes

❌ **No stop loss:** Never trade without defined risk
❌ **Stop loss too tight:** Gets stopped out by normal volatility
❌ **Stop loss too wide:** Excessive risk per trade
❌ **Fixed dollar risk:** Should be % of equity
❌ **Ignoring commission:** Eats into profits significantly
❌ **No daily limit:** Can compound losses in bad days
❌ **Over-leveraging:** Position size >25% of equity
❌ **Moving stops wider:** Breaking discipline
❌ **No take profit:** Letting winners turn into losers
❌ **Risking >5% per trade:** Recipe for account blowup
