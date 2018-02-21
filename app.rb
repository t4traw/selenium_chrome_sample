require 'bundler'
Bundler.require
Dotenv.load

options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--headless')
driver = Selenium::WebDriver.for :chrome, options: options

driver.navigate.to 'https://www.google.co.jp/'
driver.save_screenshot './google.jpg'
