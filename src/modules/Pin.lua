local _Pin = {
  pin = 0,
  mode = Pin.modes.OUTPUT,
  is_high = false,
};

function _Pin:high()
  gpio.write(self.pin, gpio.HIGH);
  self.is_high = true;
end

function _Pin:low()
  gpio.write(self.pin, gpio.LOW);
  self.is_high = false;
end

function _Pin:read()
  if self.mode == Pin.modes.INPUT then
    return gpio.read(self.pin);
  end
end

Pin = {
  modes = {
    INPUT = gpio.INPUT,
    OUTPUT = gpio.OUTPUT,
  },
};

function Pin.new(pin, mode)
  local this_pin = _Pin;
  this_pin.pin = pin;
  this_pin.mode = mode;

  gpio.mode(this_pin.pin, this_pin.mode);

  return this_pin;
end

return Pin;
