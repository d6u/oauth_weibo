module OauthWeibo
  module API
    module Statuses

      ##
      # Statuses API url
      #
      # ----------------------------------------
      PATH = {
        :statuses_public_timeline  => '/2/statuses/public_timeline.json',
        :statuses_friends_timeline => '/2/statuses/friends_timeline.json',
        :statuses_home_timeline    => '/2/statuses/home_timeline.json',
        :oauth2_get_oauth2_token   => '/oauth2/get_oauth2_token',
        :oauth2_revokeoauth2       => '/OAuth2/revokeoauth2'
      }


      ##
      # 返回最新的200条公共微博，返回结果非完全实时
      #
      # ----------------------------------------
      def statuses_public_timeline(params={}, options={})
        return send_request(:GET, PATH[:statuses_public_timeline], params, true, options)
      end


      ##
      # 获取当前登录用户及其所关注用户的最新微博
      #
      # ----------------------------------------
      def statuses_friends_timeline(params={}, options={})
        return send_request(:GET, PATH[:statuses_friends_timeline], params, true, options)
      end


      ##
      # 获取当前登录用户及其所关注用户的最新微博
      #
      # ----------------------------------------
      def statuses_home_timeline(params={}, options={})
        return send_request(:GET, PATH[:statuses_home_timeline], params, true, options)
      end


    end
  end
end
