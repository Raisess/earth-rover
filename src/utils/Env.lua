local Str = require("Str");

local _Env = {
  data = {},
};

function _Env:set(property, value)
  self.data[property] = value;
end

function _Env:get(property)
  return self.data[property];
end

Env = {};

function Env.parse()
  local f = file.open(".env", "r");

  while true do
    local line = f:readline();

    if line == nil then
      f:close();
      break;
    end

    local key_value = Str.split(line, "=");
    _Env:set(key_value[1], key_value[2]);
  end

  return _Env;
end

return Env;
