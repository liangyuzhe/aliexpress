# -*- encoding : utf-8 -*-
require 'redis'
module Aliexpress
  # 存放配置信息
  module Configure

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

    mattr_accessor :redis
    self.redis = Redis.new password: 'Fy958e5mmyb7Ta4H'

    mattr_accessor :access_token
    # self.access_token = '0549f04a-99f0-4434-9da5-48051c8594ab'

    mattr_accessor :refresh_token
    self.refresh_token = 'b6674082-c5e3-4fd7-b2d0-c2a440e45a0e'
  end
end
