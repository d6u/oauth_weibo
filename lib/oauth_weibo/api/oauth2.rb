module OauthWeibo
  module API
    module Oauth2

      ##
      # Oauth2 API url
      #
      # ----------------------------------------
      PATH = {
        :oauth2_authorize        => '/oauth2/authorize',
        :oauth2_access_token     => '/oauth2/access_token',
        :oauth2_get_token_info   => '/oauth2/get_token_info',
        :oauth2_get_oauth2_token => '/oauth2/get_oauth2_token',
        :oauth2_revokeoauth2     => '/OAuth2/revokeoauth2'
      }


      ##
      # 请求用户授权Token
      # User request authorization token
      #
      #   return a url for user to authorize this app
      #
      # ----------------------------------------
      def oauth2_authorize
        return Helper::HOST + PATH[:oauth2_authorize] + "?client_id=#{Config.client_id}&response_type=code&redirect_uri=#{Config.redirect_uri}"
      end


      ##
      # Exchange code for access token
      #
      # ----------------------------------------
      def oauth2_access_token(code, options={})
        query = {
          :client_id     => Config.client_id,
          :client_secret => Config.client_secret,
          :grant_type    => 'authorization_code',
          :redirect_uri  => Config.redirect_uri,
          :code          => code
        }
        return send_request(:POST, PATH[:oauth2_access_token], query, false, options)
      end


      ##
      #
      #
      # ----------------------------------------
      def oauth2_get_token_info

      end


      ##
      #
      #
      # ----------------------------------------
      def oauth2_get_oauth2_token

      end


      ##
      #
      #
      # ----------------------------------------
      def oauth2_revokeoauth2

      end


    end
  end
end
