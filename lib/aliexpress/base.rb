require 'nestful'
require 'openssl' # 生成特定的验证码
require 'redis'
require 'json'
module Aliexpress
  class Base

    ACCESS_TOKEN_KEY = 'aliexpress_access_token_key'.freeze
    REFRESH_TOKEN_KEY = 'aliexpress_refresh_token_key'.freeze

    # TODO 配置信息，放置在单独的模型中。

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

    # TODO: redis 密码需要特定传入
    mattr_accessor :redis
    self.redis = Redis.new password: 'Fy958e5mmyb7Ta4H'

    mattr_accessor :access_token
    # self.access_token = '0549f04a-99f0-4434-9da5-48051c8594ab'

    mattr_accessor :refresh_token
    self.refresh_token = 'b6674082-c5e3-4fd7-b2d0-c2a440e45a0e'

    #
    # 拼接 请求 API 的链接
    #
    # @example http://gw.api.alibaba.com/dev/tools/api_test_intl.html
    #
    # @note urlPath 的规则:
    #
    # @return [String] API 请求 url
    def self.api_endpoint(api_version: 1, api_namespace: 'aliexpress.open', api_name: 'dev.test', params: {}, protocol: 'param2')
      url_path = "#{protocol}/#{api_version}/#{api_namespace}/#{api_name}/#{app_key}"

      signature_factor = url_path.clone

      signature_factor << params.map { |k, v| "#{k}#{v}" }.sort.join

      puts "signature_factor = #{signature_factor}"

      signature = get_signature signature_factor

      puts "signature = #{signature}"

      params.merge!({access_token: access_token,
                     _aop_signature: signature,
                     _aop_timestamp: Time.now.to_i * 1000 # 时间戳是毫秒
                    })

      tmp_url = "#{api_url}/#{url_path}?#{params.map { |k, v| "#{k}=#{v}" }.join('&')}"

      puts tmp_url

      response = Nestful.post tmp_url

      puts response

      # 根据获取的返回值，抛出异常，刷新访问 token
      response
    end

    protected

    # 通过 redis 获取 token
    def self.access_token
      token = redis.get ACCESS_TOKEN_KEY

      return token if token.present?

      refresh_access_token
    end

    #
    # 设置访问 token
    #
    # @param response [Hash] - 获取
    def self.set_access_token(response)
      token = response['access_token']

      redis.multi do
        redis.set ACCESS_TOKEN_KEY, token
        redis.expire ACCESS_TOKEN_KEY, response['expires_in']
      end

      token
    end

    #
    # 设置 refresh code
    #
    # @param response [Hash] -
    def self.set_refresh_token(response)
      token = response['refresh_token']

      redis.multi do
        redis.set REFRESH_TOKEN_KEY, token
        redis.expireat REFRESH_TOKEN_KEY, Time.parse(response['refresh_token_timeout'])
      end

      token
    end

    #
    # 重新获取 access_token
    #
    #
    def self.refresh_access_token
      token_url = 'https://gw.api.alibaba.com/openapi/param2/1/system.oauth2/getToken'

      options = {
          grant_type: 'refresh_token',
          client_id: app_key,
          client_secret: app_secret,
          refresh_token: refresh_token
      }

      token_url = "#{token_url}/#{app_key}?#{options.map { |k, v| "#{k}=#{v}" }.join('&')}"

      puts token_url

      response = JSON.parse Nestful.post(token_url)

      puts response

      set_access_token(response)
    end


    # TODO: 刷新 token - 将 token 存放在 redis 中
    #
    def self.get_refresh_token
      refresh_token_url = 'https://gw.api.alibaba.com/openapi/param2/1/system.oauth2/postponeToken'

      options = {
          client_id: app_key,
          client_secret: app_secret,
          refresh_token: refresh_token,
          access_token: access_token
      }

      token_url = "#{refresh_token_url}/#{app_key}?#{options.map { |k, v| "#{k}=#{v}" }.join('&')}"

      # RestClient 发送 post 请求，报 RestClient::BadRequest: 400 Bad Request
      response = JSON.parse Nestful.post token_url, {}

      puts response

      set_access_token response

      set_refresh_token response
    end

    #
    # 获取签名
    #
    # 签名验证使用 Digest::HMAC 进行生成
    #
    # 判断检测地址：http://gw.api.alibaba.com/dev/tools/request_signature.html
    #
    # 例子： OpenSSL::HMAC.hexdigest OpenSSL::Digest.new('sha1'), '1FyHgep5Mkh', 'param2/1/aliexpress.open/api.getChildrenPostCategoryById/44872398cateId0'
    #
    # 验证出错了，
    def self.get_signature(signature_factor)
      OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), app_secret, signature_factor).upcase
      # Digest::HMAC.hexdigest(signature_factor, secret_key, Digest::SHA1).upcase
    end

    protected

    #
    # NOTE：针对请求使用总是过期，校准时间
    def self.adjust_time
      current_time_url = "#{api_url}/param2/1/system/currentTime/#{app_key}"

      puts current_time_url

      response = Nestful.get(current_time_url)

      puts response
    end

  end
end
