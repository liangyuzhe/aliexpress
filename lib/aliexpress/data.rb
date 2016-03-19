module Aliexpress
  class Data < Base

    # 查询商品交易表现
    # 地址： http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.queryProductBusinessInfoById&v=1
    #
    # @param [Fixnum] id -
    def self.queryProductBusinessInfoById(id = 0)
      api_endpoint 'api.queryProductBusinessInfoById', productId: id
    end

    # 查询商品每日浏览量
    # 地址： http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.queryProductViewedInfoEverydayById&v=1
    #
    # @param [Hash] params
    def self.queryProductViewedInfoEverydayById(params = {})
      api_endpoint 'api.queryProductViewedInfoEverydayById', params
    end

    # 查询每日加入购物车的数据
    # 地址： http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.queryProductAddCartInfoEverydayById&v=1
    #
    # @param [Hash] params
    def self.queryProductAddCartInfoEverydayById(params = {})
      api_endpoint 'api.queryProductAddCartInfoEverydayById', params
    end

    # 每日曝光数据
    # 地址： http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.queryProductExposedInfoEverydayById&v=1
    def self.queryProductExposedInfoEverydayById(params = {})
      api_endpoint 'api.queryProductExposedInfoEverydayById', params
    end

    # 每日销量数据
    # 地址： http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.queryProductSalesInfoEverydayById&v=1
    def self.queryProductSalesInfoEverydayById(params = {})
      api_endpoint 'api.queryProductSalesInfoEverydayById', params
    end

    # 每日收藏数
    # 地址： http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.queryProductFavoritedInfoEverydayById&v=1
    def self.queryProductFavoritedInfoEverydayById(params = {})
      api_endpoint 'api.queryProductFavoritedInfoEverydayById', params
    end
  end
end
