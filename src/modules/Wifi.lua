Wifi = {};

function Wifi.connect(ssid, pass)
  local sta_config = {
    ssid = ssid,
    pass = pass,
    save = false,
  };
  wifi.setmode(wifi.STATION);

  return wifi.sta.config(sta_config);
end

function Wifi.disconnect()
  wifi.sta.disconnect();
end

return Wifi;
