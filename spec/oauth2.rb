require 'spec_helper'


describe OauthWeibo::API::Oauth2 do

  weibo = Weibo.new

  describe "oauth2_authorize" do
    it "returns a url to redirect use to for authorization" do
      expect(weibo.oauth2_authorize).to eql("https://api.weibo.com/oauth2/authorize?client_id=#{OauthWeibo::Config.client_id}&response_type=code&redirect_uri=#{OauthWeibo::Config.redirect_uri}")
    end
  end

  describe "oauth2_access_token" do
    it "exchange code for access token" do
      expect(weibo.oauth2_access_token(Weibo::CODE)).to eql({
        :data => {
          "access_token" => "",
          "remind_in"    => "",
          "expires_in"   => nil,
          "uid"          => ""
        },
        :valid => true,
        :code  => 200
      })
    end
  end

end
