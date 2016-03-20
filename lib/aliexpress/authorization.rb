# -*- encoding : utf-8 -*-
module Aliexpress
  class Authorization < Base

    #
    # 获取授权的地址
    # 参考: Sidekiq 的实现，其 web 授权。
    def self.get_auth
      "#{auth_url}?client_id=#{Aliexpress.app_key}&site=aliexpress&redirect_uri="
    end
  end
end
