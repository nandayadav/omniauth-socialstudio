# Omniauth::Socialstudio

OmniAuth Strategy for connecting to SocialStudio API. 

(https://developer.salesforce.com/docs/atlas.en-us.api_social.meta/api_social/). 
Connection strategy is very barebones and only oauth token is returned, which can be used subsequently for other API endpoints. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-socialstudio'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-socialstudio

## Usage

## Refreshing a token
Social Studio access_tokens are short lived and need to be refreshed often. Use the refresh_token to ask for new token. Sample code below uses HTTParty. Store the new access_token returned as part of response for call below, for subsequent API calls. 

More here: (https://developer.salesforce.com/docs/atlas.en-us.200.0.api_social.meta/api_social/7-refresh-token.htm)

```ruby

#refresh_token = returned in final oauth2 step
#API_KEY = application key provided by Social Studio
#API_SECRET = application secrete provided by Social Studio

HTTParty.post(
  'https://api.socialstudio.radian6.com/oauth/token',
  query: {
    grant_type: 'refresh_token',
    refresh_token: refresh_token,
    client_id: API_KEY,
    client_secret: API_SECRET
  }
)

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nandayadav/omniauth-socialstudio. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

