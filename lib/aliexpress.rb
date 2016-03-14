# -*- encoding : utf-8 -*-
require 'aliexpress/version'
require 'logger'
require 'active_support/core_ext/module/attribute_accessors'
require 'active_support/core_ext/hash/conversions'

module Aliexpress
  autoload :Base, File.expand_path('../aliexpress/base', __FILE__)

  class << self
    include Base
  end
end
