require "rubygems"
require "bundler/setup"
Bundler.require :default, :development

require "webmock/rspec"

RSpec.configure do |config|
  config.before(:each) do
    EM::C2DM.logger = Logger.new("/dev/null")
  end
end
