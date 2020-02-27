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

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/OpenGems/rails_scopy. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).