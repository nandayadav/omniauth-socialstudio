require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Socialstudio < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :socialstudio, "https://socialstudio.radian6.com"

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.

      option :client_options, {
        site:          'https://api.socialstudio.radian6.com',
        authorize_url: '/login/oauth/authorize',
        token_url:     '/oauth/token'
      }

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid{ raw_info['id'] }

      info do
        {
          name: raw_info['name'],
          email: raw_info['email']
        }
      end

      extra do
        raw_info.merge({
          'instance_url' => access_token.params['instance_url'],
          'pod' => access_token.params['instance_url'],
          'signature' => access_token.params['signature'],
          'issued_at' => access_token.params['issued_at']
        })
      end
      
      credentials do
        hash = {'token' => access_token.token}
        hash.merge!('instance_url' => access_token.params["instance_url"])
        hash.merge!('refresh_token' => access_token.refresh_token) if access_token.refresh_token
        hash
      end

      def raw_info
        @raw_info ||= {'token_id' => access_token['id']}
      end
    end
  end
end