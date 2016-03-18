# -*- encoding : utf-8 -*-
module Aliexpress
  class Authorization
    mattr_accessor :auth_url
    self.auth_url = 'http://authhz.alibaba.com/auth/authorize.htm'

    mattr_accessor :redirect_uri
    self.redirect_uri = ''


    def self.get_auth
      "#{auth_url}?client_id=#{Aliexpress.app_key}&site=aliexpress&redirect_uri="
    end

  end
end
