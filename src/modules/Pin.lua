local _Pin = {
  _pin = 0,
  _mode = nil,
  _is_high = false,
};

function _Pin:high()
  gpio.write(self._pin, gpio.HIGH);
  self._is_high = true;
end

function _Pin:low()
  gpio.write(self._pin, gpio.LOW);
  self._is_high = false;
end

function _Pin:read()
  if self._mode == gpio.INPUT then
    return gpio.read(self._pin);
  end

  return nil;
end

function _Pin:status()
  return self._is_high;
end

Pin = {
  modes = {
    INPUT = gpio.INPUT,
    OUTPUT = gpio.OUTPUT,
  },
};

function Pin.new(pin, mode)
  local this_pin = _Pin;
  this_pin._pin = pin;
  this_pin._mode = mode;

  gpio.mode(this_pin._pin, this_pin._mode);

  return this_pin;
end

return Pin;
