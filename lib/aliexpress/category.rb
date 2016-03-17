module Aliexpress
  class Category < Base

    # 获取下级目录的类目信息
    def self.get_by_id(id = 0)
      api_endpoint api_name: 'api.getChildrenPostCategoryById', params: { cateId: id }
    end
  end
end
