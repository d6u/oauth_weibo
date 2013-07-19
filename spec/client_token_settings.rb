##
# This file is used to set up tokens for helper,
#   and class defination for mockup weibo class.
#   please use your own
#
# ========================================


OauthWeibo::Config.setup do |weibo|
  weibo.client_id = "xxx"
  weibo.client_secret = "xxxxx"
  weibo.redirect_uri = "http://xxx"
end

class Weibo
  include OauthWeibo

  CODE = "xxx"

  attr_accessor :access_token

  def initialize
    @access_token = "xxx"
  end
end
