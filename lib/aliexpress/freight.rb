# -*- encoding : utf-8 -*-
module Aliexpress
  class Freight < Base

    # 列出用户的运费模板
    # 地址： http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.listFreightTemplate&v=1
    #
    def self.listFreightTemplate
      api_endpoint 'api.listFreightTemplate'
    end

    # 通过模板ID获取运费模板的详细信息
    # 地址： http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.getFreightSettingByTemplateQuery&v=1
    #
    def self.getFreightSettingByTemplateId(id = 0 )
      api_endpoint 'api.getFreightSettingByTemplateQuery', { templateId: id }
    end

    # 计算运费
    # 地址： http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.calculateFreight&v=1
    #
    # @param [Hash] 应用级参数 - 参数比较多，就不列举了
    def self.calculateFreight(params = {})
      api_endpoint 'api.calculateFreight', params
    end
  end
end
