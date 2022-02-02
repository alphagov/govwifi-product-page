require 'rspec'
require 'capybara/rspec'

require 'middleman-core'
require 'middleman-core/rack'

require 'webdrivers/chromedriver'
Capybara.default_driver = :selenium_chrome_headless

middleman_app = ::Middleman::Application.new do
  set :root, File.expand_path(File.join(File.dirname(__FILE__), '..'))
  set :environment, :build
  set :show_exceptions, false
end

Capybara.enable_aria_label = true

Capybara.app = ::Middleman::Rack.new(middleman_app).to_app
