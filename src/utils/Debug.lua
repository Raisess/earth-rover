Debug = {};

function Debug.log(tag, title, message)
  print("[" .. string.upper(tag) .. "] " .. title .. ": " ..message);
end

return Debug;
