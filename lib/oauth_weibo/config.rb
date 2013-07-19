module OauthWeibo
  module Config
    class << self
      attr_accessor :client_id, :redirect_uri, :client_secret

      def setup
        yield self
      end
    end
  end
end
