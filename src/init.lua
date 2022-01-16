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

local loop = 3;
local led = Pin.new(1, Pin.modes.OUTPUT);

while loop > 0 do
  if led:status() then
    Debug.log("Pin", "led status", "high!");
    led:low();
  else
    Debug.log("Pin", "led status", "low!");
    led:high();
  end

  tmr.delay(1000000);
  loop = loop - 1;
end
