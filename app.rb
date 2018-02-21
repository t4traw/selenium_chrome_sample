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

element = driver.find_element(:name, 'login')
element.send_keys(ENV['YAHOO_USER_ID'])
driver.find_element(:name, 'btnNext').click
driver.save_screenshot './yahoo-2.png'

element = driver.find_element(:name, 'passwd')
element.send_keys(ENV['YAHOO_USER_PASSWORD'])
driver.find_element(:name, 'btnSubmit').click
driver.save_screenshot './yahoo-3.png'

code = driver.find_element(:class, 'dispCode').text
puts code
