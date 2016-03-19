module Aliexpress
  class Evaluation < Base

    # 查询待卖家评价的订单信息
    # 地址： http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.evaluation.querySellerEvaluationOrderList&v=1
    #
    # @param [Hash] params - 应用级参数
    def self.querySellerEvaluationOrderList(params = {})
      api_endpoint 'api.evaluation.querySellerEvaluationOrderList', params
    end

    # 卖家对未评价的订单进行评价
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.evaluation.saveSellerFeedback&v=1
    #
    # @param [Hash] params - 应用级参数
    def self.saveSellerFeedback(params = {})
      api_endpoint 'api.evaluation.saveSellerFeedback', params
    end
  end
end
