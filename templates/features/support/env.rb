require 'rspec'
require 'appium_lib'
require 'cucumber/ast'
require 'motion-juxtapose'

Juxtapose::AppiumStrategy.setup

# Create a custom World class so we don't pollute `Object` with Appium methods
class AppiumWorld; end

caps = {
  caps: {
    platformName: "ios",
    platformVersion: ENV['target'],
    app: ENV['test_sweet-app'],
    deviceName: ENV['test_sweet-device-name']
  }
}
Appium::Driver.new(caps)

Appium.promote_appium_methods AppiumWorld

World do
  AppiumWorld.new
end

Before { $driver.start_driver }
After { $driver.driver_quit }