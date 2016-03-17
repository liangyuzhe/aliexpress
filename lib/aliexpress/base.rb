require 'rest-client'
require 'nestful'
require 'openssl' # 生成特定的验证码
module Aliexpress
  class Base

    # 请求 URL 组成部分
    #
    # http://gw.api.alibaba.com/openapi/param2/1/aliexpress.open/api.findAeProductById/100000?&_aop_timestamp=1375703483649&access_token=HMKSwKPeSHB7Zk7712OfC2Gn1-kkfVsaM-P&_aop_signature=DE1D9BDE00646F5C1704930003C9FC011AADDE25
    #
    mattr_accessor :api_url
    self.api_url = 'http://gw.api.alibaba.com/openapi'

    mattr_accessor :app_key
    self.app_key = '44872398'

    mattr_accessor :app_secret
    self.app_secret = '1FyHgep5Mkh'

    mattr_accessor :access_token
    self.access_token = '0549f04a-99f0-4434-9da5-48051c8594ab'

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

      signature_factor = url_path.clone

      signature_factor << params.map { |k, v| "#{k}#{v}" }.sort.join

      puts "signature_factor = #{signature_factor}"

      signature = get_signature signature_factor

      puts "signature = #{signature}"

      params.merge!({ access_token: access_token,
                      _aop_signature: signature,
                      _aop_timestamp: Time.now.to_i
                    })

      tmp_url = "#{api_url}/#{url_path}?#{params.map { |k, v| "#{k}=#{v}" }.join('&')}"

      puts tmp_url

      response = Nestful.get tmp_url

      puts response

      # 根据获取的返回值，抛出异常，刷新访问 token

      response
    end

    protected

    #
    # 获取 token
    #
    def self.refresh_access_token
      token_url = 'https://gw.api.alibaba.com/openapi/http/1/system.oauth2/getToken'

      options = {
          grant_type: 'refresh_token',
          client_id: app_key,
          client_secret: app_secret,
          refresh_token: refresh_token,
      }

      token_url = "#{token_url}/#{app_key}?#{options.map { |k, v| "#{k}=#{v}" }.join('&')}"

      puts token_url

      response = JSON.parse Nestful.post(token_url)

      puts response

      self.access_token = response['access_token']
    end

    # 刷新 token - 将 token 存放在 redis 中
    # 将其封装在方法中
    def self.refresh_token
      'b6674082-c5e3-4fd7-b2d0-c2a440e45a0e'
    end

    #
    # 获取签名
    #
    # 签名验证使用 Digest::HMAC 进行生成
    #
    # 判断检测地址：http://gw.api.alibaba.com/dev/tools/request_signature.html
    def self.get_signature(signature_factor)
      OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), app_secret, signature_factor).upcase
      # Digest::HMAC.hexdigest(signature_factor, secret_key, Digest::SHA1).upcase
    end
  end
end
