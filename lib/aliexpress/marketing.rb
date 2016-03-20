module Aliexpress
  class Marketing < Base

    # 获取指定活动详细信息
    # 地址： http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=findSellerCouponActivity&v=1
    #
    #
    def self.findSellerCouponActivity(id = 0)
      api_endpoint 'findSellerCouponActivity', { activityId: id }
    end

    # coupon 活动查询
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=getActList&v=1
    # 
    # @param [Hash] 应用属性
    def self.getActList(params = {})
      api_endpoint 'getActList', params
    end
  end
end
