# Currency Converter

[![Build Status](https://travis-ci.org/gearnode/currency_converter.svg)](https://travis-ci.org/gearnode/currency_converter)
[![Code Climate](https://codeclimate.com/github/gearnode/currency_converter/badges/gpa.svg)](https://codeclimate.com/github/gearnode/currency_converter)
[![Test Coverage](https://codeclimate.com/github/gearnode/currency_converter/badges/coverage.svg)](https://codeclimate.com/github/gearnode/currency_converter/coverage)

Pundit provides a set of helpers which guide you in leveraging regular Ruby
classes and object oriented design patterns to build a simple, robust and
scaleable authorization system.

Links:

- [Source Code](https://github.com/gearnode/currency_converter)

## Installation

``` shell
gem build currency_converter.gemspec
gem install currency_converter-1.0.0.gem
```

## Use it

``` ruby
require 'currency_converter'

# simple convert
CC.convert(12, from: 'EUR', to: 'USD')

# convert with specific date
CC.convert(12, from: 'EUR', to: 'USD', at: '2015-07-12')
```
