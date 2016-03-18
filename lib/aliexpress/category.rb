# -*- encoding : utf-8 -*-
require 'csv'
module Aliexpress
  class Category < Base

    # 获取下级目录的类目信息
    def self.get_by_id(id = 0)
      api_endpoint api_name: 'api.getChildrenPostCategoryById', params: {cateId: id}
    end
  end

  # 生成并保存 目录的 csv 文件
  # 如果想要 层级获取，必然需要递归调用
  def self.generate_csv(id = 0)
    category_file = "tmp/aliexpress_category_#{Time.now.strftime('%Y%m%d%H%M')}.csv"

    headers = %w( id 父等级 名称-中文 名称-英文)
    categories = Aliexpress::Category.get_by_id(id)

    CSV.open category_file, 'wb' do |csv|
      csv << headers

      categories['aeopPostCategoryList'].each do |category|
        csv << [category['id'], id, category['names']['zh'], category['names']['en']]
      end

    end
  end

  #
  def self.export_all_category
    # 缓存分类
    cache_category

    # 导出分类
    dump_category
  end

  # 尝试递归失败, 递归学不好。 递归传文件做为参数，可能有些问题。
  # 换个方式，利用 缓存（Cache） 处理。
  def test_for_output_csv
    category_file = "tmp/aliexpress_category_#{Time.now.strftime('%Y%m%d%h%m')}.csv"
    headers = %w( id 等级 名称-中文 名称-英文 parent_id)
    categories = Aliexpress::Category.get_by_id(0)

    csv = CSV.open category_file, 'wb'

    csv << headers

    # 这段递归的代码写的有些问题
    def generate_csv(categories, csv, id = 0)
      categories['aeopPostCategoryList'].each do |category|
        csv << [category['id'], category['level'], category['names']['zh'], category['names']['en'], id]

        unless category['isleaf']
          generate_csv Aliexpress::Category.get_by_id(category['id']), csv, category['id']
        end
      end
    end

    generate_csv categories, csv, 0
  end

  private

  #
  # 通过接口，将获取的分类的数据保存到 redis 中
  #
  def self.cache_category(id = 0)
    tmp_category = Aliexpress::Category.get_by_id(id)
    Aliexpress.redis.hset 'categories', id, Marshal.dump(tmp_category)

    tmp_category.aeopPostCategoryList.each do |category|

      unless category.isleaf
        cache_category(category.id)
      end
    end
  end

  #
  # 将存放到 redis 中的数据存到 csv 文件中
  def self.dump_category
    category_file = "tmp/aliexpress_category_#{Time.now.strftime('%Y%m%d%h%m')}.csv"
    headers = %w(id 等级 名称-中文 名称-英文 parent_id)

    CSV.open category_file, 'wb' do |csv|
      csv << headers
      Aliexpress.redis.hgetall('categories').each do |k, v|

        Marshal.load(v).aeopPostCategoryList.each do |category|
          puts category
          csv << [category['id'], category['level'], category['names']['zh'], category['names']['en'], k]
        end
      end
    end

  end
end
