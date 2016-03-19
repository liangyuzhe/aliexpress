# -*- encoding : utf-8 -*-
module Aliexpress
  class Logistics < Base

    # 获取中国身份
    # 地址： http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.getAllProvince&v=1
    #
    def self.getAllProvince
      api_endpoint 'api.getAllProvince'
    end

    # 读取下一级别的地址信息
    # 地址： http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.getNextLevelAddressData&v=1
    #
    # @param [Hash] params - 应用参数
    def self.getNextLevelAddressData(params = {})
      api_endpoint 'api.getNextLevelAddressData', params
    end

    # 修改发货声明
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.sellerModifiedShipment&v=1
    #
    # @param [Hash] params - 应用参数
    def self.sellerModifiedShipment(params = {})
      api_endpoint 'api.sellerModifiedShipment', params
    end

    # 获取邮政小包订单信息(线上物流发货专用接口)
    # 地址： http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.getOnlineLogisticsInfo&v=1
    #
    # @param [Hash] params - 应用参数
    def self.getOnlineLogisticsInfo(params = {})
      api_endpoint 'api.getOnlineLogisticsInfo', params
    end

    # 批量获取线上发货标签(线上物流发货专用接口)
    # 地址： http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.getPrintInfos&v=1
    #
    # @param [Hash] params - 应用参数
    def self.getPrintInfos(params = {})
      api_endpoint 'api.getPrintInfos', params
    end

    # 获取线上发货标签(线上物流发货专用接口)
    # 地址： http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.getPrintInfo&v=1
    #
    # @param [Hash] params - 应用参数
    def self.getPrintInfo(params = {})
      api_endpoint 'api.getPrintInfo', params
    end

    # 根据订单号获取线上发货物流方案。
    # 地址： http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.getOnlineLogisticsServiceListByOrderId&v=1
    #
    # @note 以下包裹信息是不支持线上发货的，获取方案可能为空： 1、长\宽\高 加起来 不能大于90; 2、长宽高最大的一条边不能大于60cm; 3、包裹重量不能超过2KG; 4、已操作线下物流发货的订单。
    #
    def self.getOnlineLogisticsServiceListByOrderId(params = {})
      api_endpoint 'api.getOnlineLogisticsServiceListByOrderId', params
    end

    # 创建线上发货物流订单
    # 地址： http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.createWarehouseOrder&v=1
    #
    def self.createWarehouseOrder(params = {})
      api_endpoint 'api.createWarehouseOrder', params
    end
    
    # 获取中邮小包支持的国内快递的信息
    # 地址: http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.qureyWlbDomesticLogisticsCompany&v=1
    #
    def self.qureyWlbDomesticLogisticsCompany
      api_endpoint 'api.qureyWlbDomesticLogisticsCompany'
    end

    # 列出平台所支持的物流服务
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.listLogisticsService&v=1
    #
    def self.listLogisticsService
      api_endpoint 'api.listLogisticsService'
    end

    # 声明发货
    # 地址： http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.sellerShipment&v=1
    #
    def self.sellerShipment(params = {})
      api_endpoint 'api.sellerShipment', params
    end

    # 查询物流追踪信息
    # 地址： http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.queryTrackingResult&v=1
    #
    def self.queryTrackingResult(params = {})
      api_endpoint 'api.queryTrackingResult', params
    end
  end
end
