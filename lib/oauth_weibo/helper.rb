require "securerandom"
require "openssl"
require "base64"
require "uri"
require "net/http"
require "multi_json"

module OauthWeibo
  module Helper

    ##
    # Twitter API root url
    HOST = "https://api.weibo.com"


    ##
    # Helper to send request
    #
    # ----------------------------------------
    def send_request(method, path, original_query, token=true, options={})
      # filter out value == nil
      query = original_query.select {|key, value| !value.nil?}

      # add token by default
      query[:access_token] = self.access_token if token

      # generate HTTP request
      uri = URI.parse(HOST + path)
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      if method.to_s.upcase === 'GET'
        uri.query = URI.encode_www_form(query) if !query.empty?
        request = Net::HTTP::Get.new(uri.request_uri)
      elsif method.to_s.upcase === 'POST'
        request = Net::HTTP::Post.new(uri.request_uri)
        request.set_form_data(query) if !query.empty?
      end

      # retrive response
      return parse_response(https.request(request), options)
    end


    ##
    # ========================================
    protected

    ##
    # Parse response for cleaner outputs
    #
    # ----------------------------------------
    def parse_response(response, options={})
      result = {}
      begin
        result[:data] = MultiJson.load(response.body)
      rescue MultiJson::LoadError
        begin
          result[:data] = Hash[URI.decode_www_form(response.body)]
        rescue ArgumentError
          result[:data] = response.body
        end
      end

      if options[:detailed] === false
        return result[:data] if response.code === '200'
        return nil
      else
        result[:valid] = response.code === '200' ? true : false
        result[:code] = response.code.to_i
        return result
      end
    end


  end
end
