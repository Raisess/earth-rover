local Env = require("Env");
local Debug = require("Debug");
local Wifi = require("Wifi");
local Pin = require("Pin");

local env = Env.parse();
local wifi_ssid = env:get("WIFI_SSID");

Debug.log("ENV", "Network SSID", wifi_ssid);

local is_wifi_connected = Wifi.connect(wifi_ssid, env:get("WIFI_PASS"));
if is_wifi_connected then
  Debug.log("WIFI", "Network status", "connected!");
else
  Debug.log("WIFI", "Network status", "not connected!");
end

local red_led = Pin.new(1, Pin.modes.OUTPUT);
local green_led = Pin.new(2, Pin.modes.OUTPUT);
local blue_led = Pin.new(3, Pin.modes.OUTPUT);

while true do
  red_led:high();
  green_led:high();
  blue_led:high();
  tmr.delay(1000000);
  red_led:low();
  green_led:low();
  blue_led:low();
  tmr.delay(1000000);
end
