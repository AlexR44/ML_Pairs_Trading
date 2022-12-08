# ML Pairs Trading
![](https://isquared.digital/assets/images/vol_bm_with_drift.png)

A key quantitative trading concept is mean reversion – when a time series displays a tendency to revert to a historical mean value. This is exploited to generate trading strategies as a trade can be entered when a price series is far from the mean. 
To assess if a time series is mean-reverting, a statistical test is performed to see if it differs from the behaviour of a random walk or Geometric Brownian Motion (GBM) random walk.

It is difficult to find a tradable asset that possesses mean-reverting behaviour, as equities tend to behave like GBMs. However, we can create a portfolio of price series that is stationary.
The simplest form of mean-reverting trade strategies is the classic “pairs trade”, which usually involves a dollar-neutral long-short pair of equities.

Two companies in the same sector are likely to be exposed to similar market factors, thus exhibiting cointegration. Occasionally their relative stock prices will diverge due to certain events that affect one but not the other and their price differences will eventually revert to the long-running mean.

To employ a trading pair strategy, the following notebooks are employed:

* ticker_fetch : to pull the total ticker list of the S&P500 and store in a master equity database on PostgreSQL
* price_import_to_db : to download price data for all tickers and store in master equity database
* retrieving_data_from_db : a fuction to pull data from the master equity database
* pair_trading_strategy_SVC : Pairs trading strategy using Support Vector Classifier
* pair_trading_strategy_RFC : Pairs trading strategy using SRandom Forest Classifier
* pair_trading_strategy_QDA : Pairs trading strategy using Quadratic Discriminant Classifier

The trained ML models are saved in the MODEL directory.