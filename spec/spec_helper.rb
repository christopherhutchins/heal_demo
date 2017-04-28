require 'capybara/rspec'
require 'selenium-webdriver'
require 'httparty'

Capybara.run_server = false
Capybara.default_driver = :selenium
Capybara.app_host = 'http://patient.heal.com'
