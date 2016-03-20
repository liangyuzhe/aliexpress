# -*- encoding : utf-8 -*-
module Aliexpress
  class Order < Base

    # 一键延长买家收货时间
    # 地址: http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.extendsBuyerAcceptGoodsTime&v=1
    #
    # @note 订单状态需处于“买家确认收货”及“非纠纷、非冻结”状态下可支持该操作。
    def self.extendsBuyerAcceptGoodsTime(params = {})
      api_endpoint 'api.extendsBuyerAcceptGoodsTime', params
    end

    # 订单交易信息查询
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.findOrderTradeInfo&v=1
    #
    # @param [Hash] params - 应用参数 { orderId: 30025745255804 }
    def self.findOrderTradeInfo(params = {})
      api_endpoint 'api.findOrderTradeInfo', params
    end

    # 根据订单 ID 获取订单的交易
    def self.getOrderTradeInfoById(id = 0)
      findOrderTradeInfo orderId: id
    end

    # 订单收货信息查询
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.findOrderReceiptInfo&v=1
    #
    # @param [Hash] params -
    def self.findOrderReceiptInfo(params = {})
      api_endpoint 'api.findOrderReceiptInfo', params
    end

    # 订单基础信息查询
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.findOrderBaseInfo&v=1
    #
    def self.findOrderBaseInfo(params = {})
      api_endpoint 'api.findOrderBaseInfo', params
    end

    # 订单列表简化查询
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.findOrderListSimpleQuery&v=1
    #
    def self.findOrderListSimpleQuery(params = {})
      api_endpoint 'api.findOrderListSimpleQuery', params
    end

    # 未放款订单请款
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.requestPaymentRelease&v=1
    #
    def self.requestPaymentRelease(params = {})
      api_endpoint 'api.requestPaymentRelease', params
    end

    # 卖家在订单做请款时上传证明附件
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.updateDeliveriedConfirmationFile&v=1
    #
    def self.updateDeliveriedConfirmationFile(params = {})
      api_endpoint 'api.updateDeliveriedConfirmationFile', params
    end

    # 查询订单放款信息
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.findLoanListQuery&v=1
    #
    # @note: 目前只查询进入放款中的订单信息状态，未进入放款中订单暂未做内容兼容。
    def self.findLoanListQuery(params = {})
      api_endpoint 'api.findLoanListQuery', params
    end

    # 订单详情查询
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.findOrderById&v=1
    #
    #
    def self.findOrderById(params = {})
      api_endpoint 'api.findOrderById', params
    end

    # 交易订单列表查询
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.findOrderListQuery&v=1
    #
    # @note: 订单状态会多一个全新的值RISK_CONTROL 该值的含义是订单处于风控24小时中，从买家在线支付完成后开始，持续24小时。
    def self.findOrderListQuery(params = {})
      api_endpoint 'api.findOrderListQuery', params
    end
  end
end
