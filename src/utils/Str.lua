Str = {};

function Str.split(str, target)
  local tmp = {};
  for match in string.gmatch(str, "([^"..target.."]+)") do
    table.insert(tmp, match);
  end
  return tmp;
end

function Str.to_string(value)
  if type(value) == "boolean" then
    return value and "true" or "false";
  elseif type(value) == "nil" then
    return "nil";
  end

  return tostring(value);
end

return Str;
