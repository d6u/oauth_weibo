require "oauth_weibo/version"
require "oauth_weibo/config"
require "oauth_weibo/helper"
require "oauth_weibo/api/oauth2"
require "oauth_weibo/api/statuses"


module OauthWeibo
  include Helper
  include API::Oauth2
  include API::Statuses
end
