local Env = require("Env");
local Wifi = require("Wifi");
local Debug = require("Debug");

local env = Env.parse();
local wifi_ssid = env:get("WIFI_SSID");

Debug.log("ENV", "Network SSID", wifi_ssid);

local is_wifi_connected = Wifi.connect(wifi_ssid, env:get("WIFI_PASS"));
if is_wifi_connected then
  Debug.log("WIFI", "Network status", "connected!");
else
  Debug.log("WIFI", "Network status", "not connected!");
end
