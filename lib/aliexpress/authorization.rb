# -*- encoding : utf-8 -*-
module Aliexpress
  class Authorization < Base

    #
    # 获取授权的地址
    def self.get_auth
      "#{auth_url}?client_id=#{Aliexpress.app_key}&site=aliexpress&redirect_uri="
    end
  end
end
