// TODO add tests
var BackTestWithRandomEnv = function (symbol, interval, startDate, options) {
    var env = {
      symbol: symbol,
      interval: interval,
      startDate: startDate,
      _processToStart: [],
      _processToStop: [],
      isRunning: false
    };
    // Backtest part
    env.accountAdapter = new BacktestAccountAdapter();
    env.marketAdapter = new BacktestMarketAdapter(env.accountAdapter);

    // Random part
    env.getTickAdapter = function (currency, startDate) {
      var tickAdapter = new RandomTickAdapter(currency, startDate,
        {
          seed: options.seed,
          initialValue: options.initialPrice,
          roundTo: options.precision,
          tickPeriodInMs: Math.round(moment.duration(getInterval(interval).periodicity, getInterval(interval).periodicityUnit).asMilliseconds() / options.nbTicksByPeriod),
          deltaByTick: options.deltaByTick,
          bidAskDelta: options.bidAskDelta,
          maxVolumeByTick: options.maxVolumeByTick,
          arithmeticWalk: options.arithmeticWalk,
          speed: options.speed
        });

      tickAdapter.addListener(env.marketAdapter);
      env._processToStart.push(tickAdapter);
      env._processToStop.push(tickAdapter);
      return tickAdapter;
    };


    env.getBarAdapter = function (currency, interval, tickAdapter, startDate) {
      var rba = new RandomBarAdapter(currency, interval, startDate,
        {
          seed: options.seed,
          initialValue: options.initialPrice,
          roundTo: options.precision,
          nbInitialTicksByPeriod: options.nbTicksByPeriod,
          maxVolumeByTick: options.maxVolumeByTick,
          arithmeticWalk: options.arithmeticWalk
        });

      rba.init();
      tickAdapter.addListener(rba);
      return rba;
    };


    // Main prices feeds
    env.mainTickAdapter = env.getTickAdapter(symbol, startDate);
    env.mainBarAdapter = env.getBarAdapter(symbol, interval, env.mainTickAdapter, startDate);


    env.start = function (script) {
      script.init();
      env.mainTickAdapter.addListener(script);
      env._processToStart.forEach(function (process) {
        process.start();
      });
      env.isRunning = true;
    };

    env.stop = function () {
      env._processToStart.forEach(function (process) {
        process.stop();
      });
      env.isRunning = false;
    };


    return env;
  }
  ;



