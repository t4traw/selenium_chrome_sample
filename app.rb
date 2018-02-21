require 'bundler'
Bundler.require
Dotenv.load

options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--headless')
driver = Selenium::WebDriver.for :chrome, options: options

driver.navigate.to 'https://www.google.co.jp/'
driver.save_screenshot './google.png'

yahoo_application_id = ENV['YAHOO_APPLICATION_ID']
YAHOO_AUTH_URL = "https://auth.login.yahoo.co.jp/yconnect/v1/authorization?response_type=code+id_token&client_id=#{yahoo_application_id}&state=foobar&redirect_uri=oob&nonce=hogehoge"
driver.navigate.to YAHOO_AUTH_URL
driver.save_screenshot './yahoo-1.png'
