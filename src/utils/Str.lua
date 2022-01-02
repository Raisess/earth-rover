Str = {};

function Str.split(str, target)
  local tmp = {};
  for match in string.gmatch(str, "([^"..target.."]+)") do
    table.insert(tmp, match);
  end
  return tmp;
end

return Str;
