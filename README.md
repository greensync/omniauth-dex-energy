# omniauth-dex-energy

![CI](https://github.com/greensync/omniauth-dex-energy/workflows/CI/badge.svg)

An OmniAuth strategy to authenticate with deX.

## Table of Contents

- [omniauth-dex-energy](#omniauth-dex-energy)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
  - [Usage](#usage)
    - [First Steps](#first-steps)
    - [Sinatra](#sinatra)
  - [Development](#development)
  - [Contributing](#contributing)
  - [License](#license)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-dex-energy'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install omniauth-dex-energy

## Usage

### First Steps

Regardless of your web framework, you will need to provision an OAuth2 Client in the IdP through the [GreenSync Platform Team](mailto:internalplatform@greensync.com.au). You'll be provided with a Client ID and Client Secret that can be used to configure this gem.

Contact the [GreenSync Platform Team].

### Sinatra

See [`examples/sinatra/app.rb`](examples/sinatra/app.rb) for example usage.

To run the example application:

```bash
export OAUTH2_CLIENT_ID='my-client-id'
export OAUTH2_CLIENT_SECRET='my-client-secret'

cd examples/sinatra
bundle install
bundle exec foreman start
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/greensync/omniauth-dex-energy.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
