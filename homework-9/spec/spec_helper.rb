require 'rack/test'
require 'rspec'
require 'capybara'
require 'capybara/dsl'

require File.expand_path '../../boot.rb', __FILE__

ENV['RACK_ENV'] = 'test'

Capybara.app = Sinatra::Application




module RSpecMixin
  RSpec.configure do |config|
    config.include Capybara
  end
  include Rack::Test::Methods
  def app() Sinatra::Application end
end


RSpec.configure { |c| c.include RSpecMixin }
