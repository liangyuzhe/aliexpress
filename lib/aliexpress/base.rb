require 'rest-client'
require 'digest/hmac' # 生成特定的验证码
module Aliexpress
  module Base
    # 请求 URL 组成部分
    #
    # http://gw.api.alibaba.com/openapi/param2/1/aliexpress.open/api.findAeProductById/100000?&_aop_timestamp=1375703483649&access_token=HMKSwKPeSHB7Zk7712OfC2Gn1-kkfVsaM-P&_aop_signature=DE1D9BDE00646F5C1704930003C9FC011AADDE25
    #
    mattr_accessor :api_url
    self.api_url = 'http://gw.api.alibaba.com/openapi'

    mattr_accessor :app_key
    self.app_key = '29532596'

    mattr_accessor :secret_key
    self.secret_key = 'nw8erlBjt9jS'

    mattr_accessor :access_token

    mattr_accessor :logger
    self.logger = Logger.new(STDOUT)
    self.logger.level = Logger::INFO

    #
    # 拼接 请求 API 的链接
    #
    # @example http://gw.api.alibaba.com/dev/tools/api_test_intl.html
    #
    # @return [String] API 请求 url
    def self.api_endpoint(api_version: 1, api_namespace: 'aliexpress.open', api_name: 'dev.test', params: {}, protocol: 'param2')
      url_path = "#{protocol}/#{api_version}/#{api_namespace}/#{api_name}/#{app_key}"

      signature_factor = url_path
      params.map { |k, v| signature_factor << "#{k}#{v}"  }

      puts "signature_factor = #{signature_factor}"

      signature = get_signature signature_factor

      puts "signature = #{signature}"

      "#{api_url}/#{url_path}?#{params.map { |k, v| "#{k}=#{v}" }.join('&')}&access_token=#{access_token}&_aop_signature=#{signature}&_aop_timestamp=#{Time.now.to_i}"
    end

    protected

    #
    # 获取 token
    def self.access_token
      
    end

    def self.refresh_token

    end

    #
    # 获取签名
    #
    # 签名验证使用 Digest::HMAC 进行生成
    #
    # 判断检测地址：http://gw.api.alibaba.com/dev/tools/request_signature.html
    def self.get_signature(signature_factor)
      Digest::HMAC.hexdigest(signature_factor, secret_key, Digest::SHA1).upcase
    end
  end
end
