# -*- encoding : utf-8 -*-
require 'aliexpress/version'
require 'active_support/core_ext/module/attribute_accessors'
require 'active_support/core_ext/hash/conversions'

module Aliexpress
  autoload :Configure, File.expand_path('../aliexpress/configure', __FILE__)

  class << self
    include Configure
  end
end

Gem.find_files('aliexpress/*.rb').each { |path| require path }
