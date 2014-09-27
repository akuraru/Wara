# Wara

[![Build Status](https://travis-ci.org/akuraru/Wara.svg?branch=master)](https://travis-ci.org/akuraru/Wara)
[![Coverage Status](https://coveralls.io/repos/akuraru/Wara/badge.png?branch=master)](https://coveralls.io/r/akuraru/Wara?branch=master)
[![Code Climate](https://codeclimate.com/github/akuraru/Wara/badges/gpa.svg)](https://codeclimate.com/github/akuraru/Wara)

Wara generate a scapegoat for objects of CoreData.

You are using CoreDate, if you want to change the Entity, it is necessary to create a sub-context.However, it takes time be used to manage the sub-context.On the other hand, it is necessary to undo to the default context if one context.

Wara is used to generate an object to make changes without the operation of the context if you want to change the entity.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wara'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wara

## Usage

    $ wara -m MyDataModel.xcdatamodeld/MyDataModel.xcdatamodel

## Contributing

1. Fork it ( https://github.com/[my-github-username]/wara/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
