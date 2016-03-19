# -*- encoding : utf-8 -*-
module Aliexpress
  # 平台通用的信息
  class Common < Base


    #
    # NOTE：针对请求使用总是过期，校准时间。结果，校准时间是毫秒
    #
    def self.adjust_time
      current_time_url = "#{api_url}/param2/1/system/currentTime/#{app_key}"

      puts current_time_url

      response = Nestful.get(current_time_url)

      puts response
    end
  end
end
