# Yolt

A Ruby client for the Yolt API.

Documentation for the Yolt API can be found here: https://developer.yolt.com/docs
The reference docs can be found here: https://developer.yolt.com/reference

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yolt'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install yolt

## Usage

To configure the Yolt client, you will need details provided here: https://developer.yolt.com/management/

```ruby
Yolt.configure do |config|
  config.client_id = 'YOUR_CLIENT_ID'
  config.request_token_public_key_id = 'YOUR_REQUEST_TOKEN_PUBLIC_KEY_ID'
  config.tls_certificate = IO.read('tls-certificate.pem')
  config.tls_private_key = IO.read('tls-private-key.pem')
  config.private_key_path = 'private-key.pem'
end
```

After configuration, you can perform requests like so:

```ruby
Yolt.client.client_users.create(country_code: 'NL')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jorttbv/yolt.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
