local Env = require("Env");

local env = Env.parse();

local sta_config = {};
sta_config.ssid = env:get("WIFI_SSID");
sta_config.pwd = env:get("WIFI_PASS");
sta_config.save = false;

wifi.setmode(wifi.STATION);

print("[WIFI] Network SSID: " .. sta_config.ssid);
if (wifi.sta.config(sta_config)) then
  print("[WIFI] Network status: connected!");
else
  print("[WIFI] Network status: not connected!");
end
