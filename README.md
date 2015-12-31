# Currency Converter

[![Build Status](https://travis-ci.org/gearnode/moneyc.svg)](https://travis-ci.org/gearnode/moneyc)
[![Code Climate](https://codeclimate.com/github/gearnode/moneyc/badges/gpa.svg)](https://codeclimate.com/github/gearnode/moneyc)
[![Test Coverage](https://codeclimate.com/github/gearnode/moneyc/badges/coverage.svg)](https://codeclimate.com/github/gearnode/moneyc/coverage)
[![Dependency Status](https://gemnasium.com/gearnode/currency_converter.svg)](https://gemnasium.com/gearnode/currency_converter)
[![Inline docs](http://inch-ci.org/github/gearnode/currency_converter.svg?branch=master)](http://inch-ci.org/github/gearnode/currency_converter)

Moneyc is a library that allows you to get the exchange rate and conversion of one currency to another. This library uses the API of the European Central Bank via Fixer.io.

Get historical rates for any day since 1999 (2000 January 3).

Links:

- [Source Code](https://github.com/gearnode/moneyc)
- [Documentation](http://rubydoc.info/github/gearnode/moneyc/master)

## Installation

``` ruby
gem 'moneyc'
```
or
``` shell
gem install moneyc
```


## Use it

``` ruby
require 'moneyc'

# Convert 7.55 EUR to USD
Moneyc::Converter.new(from: 'EUR', to: 'USD').convert(7.55)
# => Float

# Convert with specific date 7.55 EUR to USD
Moneyc::Converter.new(from: 'EUR', to: 'USD', at: Time.now).convert(7.55)
# => Float

# Get today rate (EUR to USD)
Moneyc::Converter.new(from: 'EUR', to: 'USD').rate
# => Integer or Float

# Get specific date rate (EUR to USD)
Moneyc::Converter.new(from: 'EUR', to: 'USD', at: Time.now).rate
# => Integer or Float
```
