# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aliexpress/version'

Gem::Specification.new do |spec|
  spec.name          = 'aliexpress'
  spec.version       = Aliexpress::VERSION
  spec.authors       = ['xiajian']
  spec.email         = ['jhqy2011@gmail.com']

  spec.summary       = %q{aliexpress: 包装速卖通 API 的 gem }
  spec.description   = %q{ 出于工作需要，对阿里速卖通的 api 进行 Ruby sdk 封装, 从而方便自己使用 }
  spec.homepage      = 'https://github.com/xiajian/aliexpress'
  spec.license       = 'MIT'

  if spec.respond_to?(:metadata)
    # spec.metadata['allowed_push_host'] = 'http://mygemserver.com'
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = Dir['{lib,vendor,bin,app}/**/*']
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rest-client', '>= 1.6.7'
  spec.add_dependency 'nestful'
  spec.add_dependency 'redis', '>= 3.1.0'
  spec.add_dependency 'activesupport', '~> 4.0'
  spec.add_dependency 'hashie'

  # 开发使用 gem 包, 参考 weixin_authorize
  spec.add_development_dependency 'bundler', '~> 1.8'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'redis-namespace'
  spec.add_development_dependency 'codeclimate-test-reporter'
  spec.add_development_dependency 'simplecov', '~> 0.10.0'
  spec.add_development_dependency 'coveralls', '~> 0.8.2'
  spec.add_development_dependency 'pry-rails'

  if RUBY_PLATFORM != 'java'
    spec.add_development_dependency 'pry-byebug'
  end

end
