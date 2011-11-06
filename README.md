NbpExchange (in dev)
====================

Simple gem for getting average exchange rate for PLN (polski zloty) from NBP
---------------------------------------------------------------------------

This gem helps to get average exchange rate PLN to (USD,EUR) for given date.
For version 0.0.1 it supports only dates from 2011-08-01

Usage
-----

```
currency = NbpExhchange::Currency.new('usd')

rate = currency.rate(Date.parse("2011-11-02"))
rate.average_currency_rate
```

