require 'rest-client'
module Aliexpress
  module Base
    # 请求 URL 组成部分
    #
    # http://gw.api.alibaba.com/openapi/param2/1/aliexpress.open/api.findAeProductById/100000?&_aop_timestamp=1375703483649&access_token=HMKSwKPeSHB7Zk7712OfC2Gn1-kkfVsaM-P&_aop_signature=DE1D9BDE00646F5C1704930003C9FC011AADDE25
    #
    mattr_accessor :api_url
    self.api_url = 'http://gw.api.alibaba.com/openapi/param2'

    mattr_accessor :app_key
    self.app_key = ''

    mattr_accessor :access_token

    mattr_accessor :logger
    self.logger = Logger.new(STDOUT)
    self.logger.level = Logger::INFO

    # 请求 url
    def self.api_endpoint(api_version: 1, api_namespace: 'aliexpress.open', api_name: '', params: {})
      "#{api_url}/#{api_version}/#{api_namespace}/#{api_name}?#{params.map { |k, v| "#{k}=#{v}" }.join('&')}"
    end

    private

    def self.access_token
      
    end

    def self.refresh_token

    end

    def get_signature
      
    end
  end
end
