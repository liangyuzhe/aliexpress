# -*- encoding : utf-8 -*-
module Aliexpress
  # 平台通用的信息
  class Common < Base

    # 查询速卖通平台公告信息
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.queryAeAnouncement&v=1
    #
    # @param [Hash] params
    def self.queryAeAnouncement(params = {})
      api_endpoint 'api.queryAeAnouncement', params
    end

    # 查询速卖通服务市场公告信息
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.queryServiceAnouncement&v=1
    #
    # @param [Hash] params
    def self.queryServiceAnouncement(params = {})
      api_endpoint 'api.queryServiceAnouncement', params
    end

    # 查询开放平台公告信息
    # 地址： http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.queryOpenAnouncement&v=1
    #
    # @param [Hash] params
    def self.queryOpenAnouncement(params = {})
      api_endpoint 'api.queryOpenAnouncement', params
    end

    # 获取系统当前时间
    # NOTE：针对请求使用总是过期，校准时间。结果，校准时间是毫秒
    def self.adjust_time
      current_time_url = "#{api_url}/param2/1/system/currentTime/#{app_key}"

      response = Nestful.get(current_time_url)

      puts "response = #{response}"

      JSON.parse(response.body)
    end
  end
end
