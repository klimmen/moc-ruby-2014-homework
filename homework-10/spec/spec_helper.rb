require 'rack/test'
require 'rspec'
require 'capybara'
require 'capybara/dsl'
require 'factory_girl'

require File.expand_path '../../boot.rb', __FILE__


ENV['RACK_ENV'] = 'test'
FactoryGirl.find_definitions
Capybara.app = Sinatra::Application

module RSpecMixin
  RSpec.configure do |config|
    config.include Capybara
    config.include Factory::Syntax::Methods
  end
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

RSpec.configure { |c| c.include RSpecMixin }

