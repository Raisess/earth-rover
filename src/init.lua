local Env = require("Env");
local Wifi = require("Wifi");

local env = Env.parse();
local wifi_ssid = env:get("WIFI_SSID");

print("[WIFI] Network SSID: " .. wifi_ssid);
if Wifi.connect(wifi_ssid, env:get("WIFI_PASS")) then
  print("[WIFI] Network status: connected!");
else
  print("[WIFI] Network status: not connected!");
end
