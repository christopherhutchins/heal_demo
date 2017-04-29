require 'capybara/rspec'
require 'selenium-webdriver'
require 'httparty'
require 'pry-byebug'
require 'faker'

RSpec.configure do |c|
  Capybara.run_server = false
  Capybara.javascript_driver = :selenium
  Capybara.app_host = 'https://patient.heal.com'
  Capybara.default_max_wait_time = 10

  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end
end
