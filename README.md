# Currency Converter

[![Build Status](https://travis-ci.org/gearnode/currency_converter.svg)](https://travis-ci.org/gearnode/currency_converter)
[![Code Climate](https://codeclimate.com/github/gearnode/currency_converter/badges/gpa.svg)](https://codeclimate.com/github/gearnode/currency_converter)
[![Test Coverage](https://codeclimate.com/github/gearnode/currency_converter/badges/coverage.svg)](https://codeclimate.com/github/gearnode/currency_converter/coverage)
[![Dependency Status](https://gemnasium.com/gearnode/currency_converter.svg)](https://gemnasium.com/gearnode/currency_converter)
[![Inline docs](http://inch-ci.org/github/gearnode/currency_converter.svg?branch=master)](http://inch-ci.org/github/gearnode/currency_converter)

Currency Converter is a library that allows you to get the exchange rate and converstion of one currency to another. This library uses the API of the European Central Bank via Fixer.io.

Links:

- [Source Code](https://github.com/gearnode/currency_converter)
- [Documentation](http://rubydoc.info/github/gearnode/currency_converter/master)

## Installation

``` ruby
gem 'currency_converter'
```
or
``` shell
gem install currency_converter
```


## Use it

``` ruby
require 'currency_converter'

# simple convert
CC.convert(12, from: 'EUR', to: 'USD')

# convert with specific date
CC.convert(12, from: 'EUR', to: 'USD', at: '2015-07-12')
```
