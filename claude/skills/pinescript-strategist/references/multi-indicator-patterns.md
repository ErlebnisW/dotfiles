# Multi-Indicator Strategy Patterns

## Common Multi-Indicator Combinations

### 1. Trend + Momentum + Volume

**Pattern:** Combine trend-following with momentum confirmation and volume validation.

```pinescript
// Trend: Moving Average Crossover
emaFast = ta.ema(close, 12)
emaSlow = ta.ema(close, 26)
trendBullish = emaFast > emaSlow

// Momentum: RSI
rsi = ta.rsi(close, 14)
momentumBullish = rsi > 50 and rsi < 70

// Volume: Above average
volumeAvg = ta.sma(volume, 20)
volumeConfirm = volume > volumeAvg

// Combined entry
longCondition = trendBullish and momentumBullish and volumeConfirm
```

**Best for:** Trending markets (BTC, ETH on 1h-4h)

### 2. Mean Reversion with Volatility Filter

**Pattern:** Trade oversold/overbought with volatility context.

```pinescript
// Bollinger Bands for mean reversion
basis = ta.sma(close, 20)
dev = ta.stdev(close, 20)
upper = basis + (2 * dev)
lower = basis - (2 * dev)

// RSI for oversold/overbought
rsi = ta.rsi(close, 14)

// ATR for volatility filter
atr = ta.atr(14)
atrSma = ta.sma(atr, 14)
highVolatility = atr > atrSma * 1.2

// Entry: Oversold + touching lower band + high volatility
longCondition = close <= lower and rsi < 30 and highVolatility
```

**Best for:** Range-bound markets, high volatility assets

### 3. Breakout with Confirmation

**Pattern:** Price breakout validated by multiple indicators.

```pinescript
// Price breakout
highest20 = ta.highest(high, 20)
breakout = close > highest20[1]

// Volume surge
volumeSpike = volume > ta.sma(volume, 20) * 1.5

// MACD confirmation
[macdLine, signalLine, _] = ta.macd(close, 12, 26, 9)
macdBullish = macdLine > signalLine

// ADX for trend strength
[diPlus, diMinus, adx] = ta.dmi(14, 14)
strongTrend = adx > 25

// Combined
longCondition = breakout and volumeSpike and macdBullish and strongTrend
```

**Best for:** Crypto, high-momentum stocks (1h-1D)

### 4. Triple Confirmation System

**Pattern:** Require agreement from three independent indicator families.

```pinescript
// 1. Trend Family (choose one)
trendConfirm = ta.ema(close, 50) > ta.ema(close, 200)  // EMA
// OR
// trendConfirm = close > ta.sma(close, 50)  // SMA

// 2. Momentum Family (choose one)
momentumConfirm = ta.rsi(close, 14) > 50  // RSI
// OR
// [macdLine, signalLine, _] = ta.macd(close, 12, 26, 9)
// momentumConfirm = macdLine > signalLine  // MACD

// 3. Volume/Volatility Family (choose one)
volumeConfirm = volume > ta.sma(volume, 20)  // Volume
// OR
// volumeConfirm = ta.atr(14) > ta.sma(ta.atr(14), 20)  // ATR

// Entry requires all three
longCondition = trendConfirm and momentumConfirm and volumeConfirm
```

**Best for:** Conservative strategies, reducing false signals

### 5. Multi-Timeframe Confluence

**Pattern:** Align multiple timeframes for higher probability setups.

```pinescript
// Current timeframe (e.g., 1h)
ctEma = ta.ema(close, 50)
ctBullish = close > ctEma

// Higher timeframe (e.g., 4h)
htfEma = request.security(syminfo.tickerid, "240", ta.ema(close, 50))
htfBullish = close > htfEma

// Higher timeframe trend (e.g., 1D)
dailyTrend = request.security(syminfo.tickerid, "D", ta.ema(close, 20))
dailyBullish = close > dailyTrend

// Entry: All timeframes aligned
longCondition = ctBullish and htfBullish and dailyBullish
```

**Best for:** Swing trading, higher timeframe strategies (4h+)

## Advanced Pattern: Adaptive Strategy

**Pattern:** Automatically switch between trend-following and mean-reversion based on market regime.

```pinescript
// Market regime detection
adx = ta.dmi(14, 14)[2]
isTrending = adx > 25
isRanging = adx < 20

// Trend-following logic
emaFast = ta.ema(close, 12)
emaSlow = ta.ema(close, 26)
trendLong = emaFast > emaSlow and ta.rsi(close, 14) > 50

// Mean-reversion logic
bb_basis = ta.sma(close, 20)
bb_dev = ta.stdev(close, 20)
bb_lower = bb_basis - (2 * bb_dev)
reversionLong = close < bb_lower and ta.rsi(close, 14) < 30

// Adaptive entry
longCondition = (isTrending and trendLong) or (isRanging and reversionLong)
```

**Best for:** All market conditions, sophisticated strategies

## Indicator Correlation Matrix

**Avoid using highly correlated indicators together** (redundant signals):

| Indicator 1 | Indicator 2 | Correlation | Use Together? |
|------------|------------|-------------|---------------|
| EMA | SMA | High (0.95+) | No - choose one |
| RSI | Stochastic | High (0.85+) | No - redundant |
| MACD | EMA Crossover | High (0.90+) | No - similar logic |
| Bollinger Bands | ATR | Medium (0.60) | Yes - complementary |
| Volume | OBV | High (0.80+) | No - redundant |
| ADX | Bollinger Width | Medium (0.55) | Yes - different aspects |

## Optimization Priority

When optimizing multi-indicator strategies:

1. **Start with primary signal** (trend/breakout/reversion)
2. **Add strongest confirmation** (volume/momentum)
3. **Add filters** (volatility/time/regime)
4. **Fine-tune parameters** last

## Common Pitfalls

1. **Too many indicators:** >5 indicators = over-complication, curve-fitting
2. **Correlated indicators:** Using RSI + Stochastic + CCI (all momentum) = redundant
3. **Conflicting logic:** Trend-following + mean-reversion without regime filter = contradictory
4. **No hierarchy:** All indicators equal weight = noise amplification

## Best Practices

✅ Use 2-4 indicators from **different families**
✅ Establish **clear hierarchy** (primary signal + confirmation)
✅ Test each indicator's **independent value**
✅ Combine **lagging + leading** indicators
✅ Include **volume confirmation** for significant moves
