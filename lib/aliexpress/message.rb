# -*- encoding : utf-8 -*-
module Aliexpress
  class Message < Base

    # 查询获取失败的消息列表 - 需要申请权限
    # 地址： http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=push.query.messageList&v=1
    #
    # @param [Hash] params - 应用级参数
    def self.queryMessageList(params = {})
      api_endpoint 'push.query.messageList', params
    end

    # 失败消息批量确认
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=push.message.confirm&v=1
    #
    # @param [Hash] params - 应用参数
    def self.messageConfirm(params = {})
      api_endpoint 'push.message.confirm', params
    end

    # 游标式获取失败的消息列表
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=push.cursor.messageList&v=1
    #
    # @param [Hash] params - 应用参数
    def self.cursorMessageList(params = {})
      api_endpoint 'push.cursor.messageList', params
    end
  end
end
