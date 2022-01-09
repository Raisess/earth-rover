NMCUT=nodemcu-tool
PORT=/dev/ttyUSB0

ENV_FILE=./.env
SRC_DIR=./src

FILES=$(ENV_FILE) \
			$(SRC_DIR)/init.lua \
			$(SRC_DIR)/modules/Pin.lua \
			$(SRC_DIR)/modules/Wifi.lua \
			$(SRC_DIR)/utils/Debug.lua \
			$(SRC_DIR)/utils/Env.lua \
			$(SRC_DIR)/utils/Str.lua

list_devices:
	$(NMCUT) devices

reset:
	$(NMCUT) reset

format:
	$(NMCUT) mkfs --port=$(PORT)

upload:
	$(NMCUT) upload --port=$(PORT) $(FILES)

run:
	$(NMCUT) run init.lua

fun:
	make upload
	make run
