# NbpExchange

[![Build Status](https://travis-ci.org/sparrovv/nbp-exchange.png)](https://travis-ci.org/sparrovv/nbp-exchange])

Get average exchange rate for PLN (polish zloty) from NBP for given date.

It supports dates from 2011-08-01

##Usage:

```
  currency = NbpExhchange::Currency.new('usd')

  rate = currency.rate(Date.parse("2011-11-02"))
  rate.average_currency_rate
```

