# RailsScopy

[![Gem Version](https://badge.fury.io/rb/rails_scopy.svg)](https://badge.fury.io/rb/rails_scopy)
[![Maintainability](https://api.codeclimate.com/v1/badges/79cdc15c16da15562c25/maintainability)](https://codeclimate.com/github/OpenGems/rails_scopy/maintainability)
[![Build Status](https://travis-ci.org/OpenGems/rails_scopy.svg?branch=master)](https://travis-ci.org/OpenGems/rails_scopy)
[![security](https://hakiri.io/github/OpenGems/rails_scopy/master.svg)](https://hakiri.io/github/OpenGems/rails_scopy/master)
![Gem](https://img.shields.io/gem/dt/rails_scopy)
[![Coverage Status](https://coveralls.io/repos/github/OpenGems/rails_scopy/badge.svg?branch=master)](https://coveralls.io/github/OpenGems/rails_scopy?branch=master)

Generate automatically scopes in your model (PostgreSQL, SQLite, MySQL, etc...)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_scopy'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_scopy

## Usage

Include ```RailsScopy``` in each models

```ruby
class User < ApplicationRecord
  include RailsScopy
end
```

or in the parent model

```ruby
class ApplicationRecord < ActiveRecord::Base
  include RailsScopy
end
```

### Scopes available

| SQL type | Scope method | Description |
| ------------- | ------------- | ------------- |
| All | `#{column}_eq(value)` | equal |
| All | `#{column}_not_eq(value)` | not equal |
| All | `#{column}_null` | is null |
| All | `#{column}_not_null` | is not null |
| All | `#{column}_present` | not null and not empty |
| All | `#{column}_blank` | null or empty |
| All | `ascend_by_#{column}` | ascending order |
| All | `descend_by_#{column}` | descending order |
| boolean | `#{column}` | true |
| boolean | `not_#{column}` | false |
| json | `#{column}_has_key(value)` | key present in json  |
| json | `not_#{column}_has_not_key(value)` | key doesn't present in json |
| boolean | `#{column}` | true |
| boolean | `not_#{column}` | false |
| date, datetime, time | `#{column}_to(value)` | <= to  |
| date, datetime, time | `#{column}_from(value)` | from >= |
| date, datetime, time | `#{column}_after(value)` | after > |
| date, datetime, time | `#{column}_before(value)` | < before |
| date, datetime, time | `#{column}_between(value)` | from >= <= to |
| string, text | `#{column}_contains(value)` | contains |
| string, text | `#{column}_not_contains(value)` | doesn't contains |
| string, text | `#{column}_starts_with(value)` | start with |
| string, text | `#{column}_not_starts_with(value)` | doesn't start with |
| string, text | `#{column}_ends_with(value)` | end with |
| string, text | `#{column}_not_ends_with(value)` | doesn't end with |
| string, text | `#{column}_length(value)` | length eql |
| string, text | `#{column}_between_length(value)` | from >= <= to (length) |
| integer, float | `#{column}_to(value)` | <= to  |
| integer, float | `#{column}_from(value)` | from >= |
| integer, float | `#{column}_above(value)` | above > |
| integer, float | `#{column}_below(value)` | < below |
| integer, float | `#{column}_between(value)` | from >= <= to |
| float | `#{column}_scale(value)` | scale eql (Number of decimal digits) |

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/OpenGems/rails_scopy. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).