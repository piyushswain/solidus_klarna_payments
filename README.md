# KlarnaGateway

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/klarna_gateway`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'klarna_gateway'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install klarna_gateway


## Configuration

Copy Klarna specific migrations or run:

    $ rails generate klarna_gateway:install

Configure the Gem based on gem general attributes:

    config.confirmation_url

More information at:

    lib/generators/klarna_gateway/install/install_generator.rb


## Documentation

### Javascript API [link](https://credit.klarnacdn.net/lib/v1/index.html)

Api descrpition for Frontend JS implementation.

### Credit API [link](https://developers.klarna.com/api/)

Api descrpition for Backend implementation.

### Klarna Developers Portal [link](https://developers.klarna.com/)

General description of Klarna payment solutions.


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/klarna_gateway.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

