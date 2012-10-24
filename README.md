# NbpExchange

[![Build Status](https://travis-ci.org/sparrovv/nbp-exchange.png)](https://travis-ci.org/sparrovv/nbp-exchange])

Get average exchange rate for PLN (polish zloty) from NBP for given date.

It supports dates from 2011-08-01

##Usage:

Typical usage is to call currency.rate_at

If there is no rate for this date, error is raised.

```
  currency = NbpExhchange::Currency.new('usd')

  rate = currency.rate_at(date) # alias rate(date)
  rate.average_exchange_rate
  rate.date => date
```

You can also use method that will look for last available rate, if there is no
rate for this date, because of some holiday.

```
  rate = currency.last_available_rate_for(date)
  rate.date => (date - 1.day)
  rate.average_exchange_rate

```
