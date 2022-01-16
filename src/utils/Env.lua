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

function Env.parse(env_file)
  local this_env = _Env;
  local f = file.open(env_file or ".env", "r");

  while true do
    local line = f:readline();

    if line == nil then
      f:close();
      break;
    end

    local key_value = Str.split(line, "=");
    this_env:set(key_value[1], key_value[2]);
  end

  return this_env;
end

return Env;
