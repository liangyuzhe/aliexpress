# -*- encoding : utf-8 -*-
module Aliexpress
  class Product < Base

    # 卖家可以通过这个接口发布一个多语言商品。一次只能发布一种多语言商品
    # 地址: http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=alibaba.product.postMultilanguageAeProduct&v=1
    #
    def self.postMultilanguageAeProduct(params = {})
      api_endpoint 'alibaba.product.postMultilanguageAeProduct', params
    end

    # 查询商品状态，
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.findAeProductStatusById&v=1
    #
    # @note: 商品供三种状态。审核通过:approved;审核中:auditing; 审核不通过:refuse
    def self.findAeProductStatusById(params = {})
      api_endpoint 'api.findAeProductStatusById', params
    end

    # 调用发布商品接口api.postaeproduct前，针对商品标题等信息做违禁词相关信息查询接口
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.findAeProductProhibitedWords&v=1
    #
    #
    def self.findAeProductProhibitedWords(params = {})
      api_endpoint 'api.findAeProductProhibitedWords', params
    end

    # 编辑SKU的可售库存
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.editMutilpleSkuStocks&v=1
    #
    #
    def self.editMutilpleSkuStocks(params = {})
      api_endpoint 'api.editMutilpleSkuStocks', params
    end

    # 编辑商品单个 SKU 库存
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.editSingleSkuStock&v=1
    #
    def self.editSingleSkuStock(params = {})
      api_endpoint 'api.editSingleSkuStock', params
    end

    # 编辑商品的单个SKU价格信息
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.editSingleSkuPrice&v=1
    #
    def self.editSingleSkuPrice(params = {})
      api_endpoint 'api.editSingleSkuPrice', params
    end

    # 原发编辑商品多语言标题或详描描述（英文版本除外）
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.editMultilanguageProduct&v=1
    #
    #
    def self.editMultilanguageProduct(params = {})
      api_endpoint 'api.editMultilanguageProduct', params
    end

    # 可查询获取该卖家目前实际可用橱窗数量
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.getRemainingWindows&v=1
    #
    #
    def self.getRemainingWindows(params = {})
      api_endpoint 'api.getRemainingWindows', params
    end

    # 创建产品分组
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.createProductGroup&v=1
    #
    def self.createProductGroup(params = {})
      api_endpoint 'api.createProductGroup', params
    end

    # 查询当前用户在指定类目下可用的尺码模版信息。
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.getSizeChartInfoByCategoryId&v=1
    #
    def self.getSizeChartInfoByCategoryId(id = 0)
      api_endpoint 'api.getSizeChartInfoByCategoryId', { categoryId: id }
    end

    # 修改商品所引用的尺码模板
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.setSizeChart&v=1
    #
    def self.setSizeChart(params = {})
      api_endpoint 'api.setSizeChart', params
    end

    # 获取某个卖家橱窗商品目前使用情况详情
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.getWindowProducts&v=1
    #
    def self.getWindowProducts(params = {})
      api_endpoint 'api.getWindowProducts', params
    end

    # 编辑商品的类目属性，用给定的类目属性覆盖原有的类目属性
    # 地址： http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.editProductCategoryAttributes&v=1
    #
    def self.editProductCategoryAttributes(params = {})
      api_endpoint 'api.editProductCategoryAttributes', params
    end

    # 设置单个产品的产品分组信息，最多设置三个分组
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.setGroups&v=1
    #
    def self.setGroups(params = {})
      api_endpoint 'api.setGroups', params
    end

    # 查询指定商品ID所在产品分组
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.queryProductGroupIdByProductId&v=1
    #
    def self.queryProductGroupIdByProductId(params = {})
      api_endpoint 'api.queryProductGroupIdByProductId', params
    end

    # 获取当前会员的产品分组
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.getProductGroupList&v=1
    #
    def self.getProductGroupList(params = {})
      api_endpoint 'api.getProductGroupList', params
    end

    # 编辑产品类目、属性、sku
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.editProductCidAttIdSku&v=1
    #
    def self.editProductCidAttIdSku(params = {})
      api_endpoint 'api.editProductCidAttIdSku', params
    end

    # 编辑商品的单个字段
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.editSimpleProductFiled&v=1
    #
    def self.editSimpleProductFiled(params = {})
      api_endpoint 'api.editSimpleProductFiled', params
    end

    # 获取属性需要优化的商品列表
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.getAtributeMissingProductList&v=1
    #
    def self.getAtributeMissingProductList(params = {})
      api_endpoint 'api.getAtributeMissingProductList', params
    end

    # 通过淘宝产品的url进行单品认领
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.claimTaobaoProducts4API&v=1
    #
    def self.claimTaobaoProducts4API(params = {})
      api_endpoint 'api.claimTaobaoProducts4API', params
    end

    # 商品橱窗设置
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.setShopwindowProduct&v=1
    #
    def self.setShopwindowProduct(params = {})
      api_endpoint 'api.setShopwindowProduct', params
    end

    # 服务模板查询
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.queryPromiseTemplateById&v=1
    #
    def self.queryPromiseTemplateById(params = {})
      api_endpoint 'api.queryPromiseTemplateById', params
    end

    # 获取淘宝原始产品信息
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.listTbProductByIds&v=1
    #
    def self.listTbProductByIds(params = {})
      api_endpoint 'api.listTbProductByIds', params
    end

    # 查询信息模板列表
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.findAeProductDetailModuleListByQurey&v=1
    #
    def self.findAeProductDetailModuleListByQurey(params = {})
      api_endpoint 'api.findAeProductDetailModuleListByQurey', params
    end

    # 查询单个信息模板详情
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.findAeProductModuleById&v=1
    #
    def self.findAeProductModuleById(params = {})
      api_endpoint 'api.findAeProductModuleById', params
    end

    # 商品上架
    # 地址： http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.onlineAeProduct&v=1
    #
    def self.onlineAeProduct(params = {})
      api_endpoint 'api.onlineAeProduct', params
    end

    # 商品下架
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.offlineAeProduct&v=1
    #
    def self.offlineAeProduct(params = {})
      api_endpoint 'api.offlineAeProduct', params
    end

    # 修改编辑商品信息
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.editAeProduct&v=1
    #
    def self.editAeProduct(params = {})
      api_endpoint 'api.editAeProduct', params
    end

    # 获取单个产品信息
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.findAeProductById&v=1
    #
    def self.findAeProductById(params = {})
      api_endpoint 'api.findAeProductById', params
    end

    # 商品列表查询接口
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.findProductInfoListQuery&v=1
    #
    def self.findProductInfoListQuery(params = {})
      api_endpoint 'api.findProductInfoListQuery', params
    end

    # 发布产品信息
    # 地址：http://gw.api.alibaba.com/dev/doc/intl/api.htm?ns=aliexpress.open&n=api.postAeProduct&v=1
    #
    def self.postAeProduct(params = {})
      api_endpoint 'api.postAeProduct', params
    end
  end
end
